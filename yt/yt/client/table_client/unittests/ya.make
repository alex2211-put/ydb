GTEST(unittester-client-table-client)

INCLUDE(${ARCADIA_ROOT}/yt/ya_cpp.make.inc)

ALLOCATOR(YT)

SRCS(
    columnar_ut.cpp
    serialization_ut.cpp
)

INCLUDE(${ARCADIA_ROOT}/yt/opensource_tests.inc)

PEERDIR(
    yt/yt/client
    yt/yt/client/formats
    yt/yt/client/table_client/unittests/helpers
    yt/yt/client/unittests/mock
    yt/yt/core/test_framework
)

SIZE(MEDIUM)

END()
