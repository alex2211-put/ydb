#pragma once

#include <library/cpp/yt/logging/logger.h>

struct TGUID;

namespace NYT {

////////////////////////////////////////////////////////////////////////////////

extern NLogging::TLogger Logger;

void FormatValue(TStringBuilderBase* builder, const TGUID& value, TStringBuf format);

////////////////////////////////////////////////////////////////////////////////

} // namespace NYT
