--!syntax_v1
CREATE TABLE `{table}`
(
    WatchID Int64 {notnull},
    JavaEnable Int32 {notnull},
    Title Text {notnull},
    GoodEvent Int32 {notnull},
    EventTime Timestamp {notnull},
    EventDate Timestamp {notnull},
    CounterID Int32 {notnull},
    ClientIP Int32 {notnull},
    RegionID Int32 {notnull},
    UserID Int64 {notnull},
    CounterClass Int32 {notnull},
    OS Int32 {notnull},
    UserAgent Int32 {notnull},
    URL Text {notnull},
    Referer Text {notnull},
    IsRefresh Int32 {notnull},
    RefererCategoryID Int32 {notnull},
    RefererRegionID Int32 {notnull},
    URLCategoryID Int32 {notnull},
    URLRegionID Int32 {notnull},
    ResolutionWidth Int32 {notnull},
    ResolutionHeight Int32 {notnull},
    ResolutionDepth Int32 {notnull},
    FlashMajor Int32 {notnull},
    FlashMinor Int32 {notnull},
    FlashMinor2 Text {notnull},
    NetMajor Int32 {notnull},
    NetMinor Int32 {notnull},
    UserAgentMajor Int32 {notnull},
    UserAgentMinor Bytes {notnull},
    CookieEnable Int32 {notnull},
    JavascriptEnable Int32 {notnull},
    IsMobile Int32 {notnull},
    MobilePhone Int32 {notnull},
    MobilePhoneModel Text {notnull},
    Params Text {notnull},
    IPNetworkID Int32 {notnull},
    TraficSourceID Int32 {notnull},
    SearchEngineID Int32 {notnull},
    SearchPhrase Text {notnull},
    AdvEngineID Int32 {notnull},
    IsArtifical Int32 {notnull},
    WindowClientWidth Int32 {notnull},
    WindowClientHeight Int32 {notnull},
    ClientTimeZone Int32 {notnull},
    ClientEventTime Timestamp {notnull},
    SilverlightVersion1 Int32 {notnull},
    SilverlightVersion2 Int32 {notnull},
    SilverlightVersion3 Int32 {notnull},
    SilverlightVersion4 Int32 {notnull},
    PageCharset Text {notnull},
    CodeVersion Int32 {notnull},
    IsLink Int32 {notnull},
    IsDownload Int32 {notnull},
    IsNotBounce Int32 {notnull},
    FUniqID Int64 {notnull},
    OriginalURL Text {notnull},
    HID Int32 {notnull},
    IsOldCounter Int32 {notnull},
    IsEvent Int32 {notnull},
    IsParameter Int32 {notnull},
    DontCountHits Int32 {notnull},
    WithHash Int32 {notnull},
    HitColor Bytes {notnull},
    LocalEventTime Timestamp {notnull},
    Age Int32 {notnull},
    Sex Int32 {notnull},
    Income Int32 {notnull},
    Interests Int32 {notnull},
    Robotness Int32 {notnull},
    RemoteIP Int32 {notnull},
    WindowName Int32 {notnull},
    OpenerName Int32 {notnull},
    HistoryLength Int32 {notnull},
    BrowserLanguage Text {notnull},
    BrowserCountry Text {notnull},
    SocialNetwork Text {notnull},
    SocialAction Text {notnull},
    HTTPError Int32 {notnull},
    SendTiming Int32 {notnull},
    DNSTiming Int32 {notnull},
    ConnectTiming Int32 {notnull},
    ResponseStartTiming Int32 {notnull},
    ResponseEndTiming Int32 {notnull},
    FetchTiming Int32 {notnull},
    SocialSourceNetworkID Int32 {notnull},
    SocialSourcePage Text {notnull},
    ParamPrice Int64 {notnull},
    ParamOrderID Text {notnull},
    ParamCurrency Text {notnull},
    ParamCurrencyID Int32 {notnull},
    OpenstatServiceName Text {notnull},
    OpenstatCampaignID Text {notnull},
    OpenstatAdID Text {notnull},
    OpenstatSourceID Text {notnull},
    UTMSource Text {notnull},
    UTMMedium Text {notnull},
    UTMCampaign Text {notnull},
    UTMContent Text {notnull},
    UTMTerm Text {notnull},
    FromTag Text {notnull},
    HasGCLID Int32 {notnull},
    RefererHash Int64 {notnull},
    URLHash Int64 {notnull},
    CLID Int32 {notnull},
    --PRIMARY KEY (CounterID, EventDate, UserID, EventTime, WatchID)
    PRIMARY KEY (EventTime, CounterID, EventDate, UserID, WatchID)
)
{partition}
WITH (
    {store}
    AUTO_PARTITIONING_BY_SIZE = ENABLED,
    AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 128
);
