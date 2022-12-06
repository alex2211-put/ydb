#include "checker.h"

#include <ydb/core/tx/tiering/external_data.h>
#include <ydb/core/tx/tiering/rule/ss_checker.h>
#include <ydb/services/metadata/secret/fetcher.h>

namespace NKikimr::NColumnShard::NTiers {

void TTierPreparationActor::StartChecker() {
    if (!Tierings || !Secrets || !SSCheckResult) {
        return;
    }
    auto g = PassAwayGuard();
    if (!SSCheckResult->GetContent().GetOperationAllow()) {
        Controller->PreparationProblem(SSCheckResult->GetContent().GetDenyReason());
        return;
    }
    for (auto&& tier : Objects) {
        if (Context.GetActivityType() == NMetadata::IOperationsManager::EActivityType::Drop) {
            std::set<TString> tieringsWithTiers;
            for (auto&& i : Tierings->GetTableTierings()) {
                if (i.second.ContainsTier(tier.GetTierName())) {
                    tieringsWithTiers.emplace(i.first);
                    if (tieringsWithTiers.size() > 10) {
                        break;
                    }
                }
            }
            if (tieringsWithTiers.size()) {
                Controller->PreparationProblem("tier in usage for tierings: " + JoinSeq(", ", tieringsWithTiers));
                return;
            }
        }
        if (!Secrets->CheckSecretAccess(tier.GetProtoConfig().GetObjectStorage().GetAccessKey(), Context.GetUserToken())) {
            Controller->PreparationProblem("no access for secret: " + tier.GetProtoConfig().GetObjectStorage().GetAccessKey());
            return;
        } else if (!Secrets->CheckSecretAccess(tier.GetProtoConfig().GetObjectStorage().GetSecretKey(), Context.GetUserToken())) {
            Controller->PreparationProblem("no access for secret: " + tier.GetProtoConfig().GetObjectStorage().GetSecretKey());
            return;
        }
    }
    Controller->PreparationFinished(std::move(Objects));
}

void TTierPreparationActor::Handle(NSchemeShard::TEvSchemeShard::TEvProcessingResponse::TPtr& ev) {
    auto& proto = ev->Get()->Record;
    if (proto.HasError()) {
        Controller->PreparationProblem(proto.GetError().GetErrorMessage());
        PassAway();
    } else if (proto.HasContent()) {
        SSCheckResult = SSFetcher->UnpackResult(ev->Get()->Record.GetContent().GetData());
        if (!SSCheckResult) {
            Controller->PreparationProblem("cannot unpack ss-fetcher result for class " + SSFetcher->GetClassName());
            PassAway();
        } else {
            StartChecker();
        }
    } else {
        Y_VERIFY(false);
    }
}

void TTierPreparationActor::Handle(NMetadataProvider::TEvRefreshSubscriberData::TPtr& ev) {
    if (auto snapshot = ev->Get()->GetSnapshotPtrAs<NMetadata::NSecret::TSnapshot>()) {
        Secrets = snapshot;
    } else if (auto snapshot = ev->Get()->GetSnapshotPtrAs<TConfigsSnapshot>()) {
        Tierings = snapshot;
        std::set<TString> tieringIds;
        std::set<TString> tiersChecked;
        for (auto&& tier : Objects) {
            if (!tiersChecked.emplace(tier.GetTierName()).second) {
                continue;
            }
            auto tIds = Tierings->GetTieringIdsForTier(tier.GetTierName());
            if (tieringIds.empty()) {
                tieringIds = std::move(tIds);
            } else {
                tieringIds.insert(tIds.begin(), tIds.end());
            }
        }
        {
            SSFetcher = std::make_shared<TFetcherCheckUserTieringPermissions>();
            SSFetcher->SetUserToken(Context.GetUserToken());
            SSFetcher->SetActivityType(Context.GetActivityType());
            SSFetcher->MutableTieringRuleIds() = tieringIds;
            Register(new TSSFetchingActor(SSFetcher, std::make_shared<TSSFetchingController>(SelfId()), TDuration::Seconds(10)));
        }
    } else {
        Y_VERIFY(false);
    }
    StartChecker();
}

void TTierPreparationActor::Bootstrap() {
    Become(&TThis::StateMain);
    Send(NMetadataProvider::MakeServiceId(SelfId().NodeId()),
        new NMetadataProvider::TEvAskSnapshot(std::make_shared<NMetadata::NSecret::TSnapshotsFetcher>()));
    Send(NMetadataProvider::MakeServiceId(SelfId().NodeId()),
        new NMetadataProvider::TEvAskSnapshot(std::make_shared<TSnapshotConstructor>()));
}

TTierPreparationActor::TTierPreparationActor(std::vector<TTierConfig>&& objects,
    NMetadataManager::IAlterPreparationController<TTierConfig>::TPtr controller,
    const NMetadata::IOperationsManager::TModificationContext& context)
    : Objects(std::move(objects))
    , Controller(controller)
    , Context(context)
{

}

}
