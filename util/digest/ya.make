SUBSCRIBER(g:util-subscribers)

IF (NOT OS_EMSCRIPTEN)
    RECURSE(
        benchmark
        ut
    )
ENDIF()

IF (NOT OS_IOS AND NOT OS_ANDROID AND NOT OS_EMSCRIPTEN AND NOT USE_SYSTEM_PYTHON)
    RECURSE(
        ut_cython
    )
ENDIF()
