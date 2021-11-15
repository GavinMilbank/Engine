cmake_minimum_required(VERSION 2.4)

# Settings:
set(CTEST_DASHBOARD_ROOT                "/home/jovyan/cmake-3.15.2/Tests/CTestTest")
set(CTEST_SITE                          "1b116e00b26c")
set(CTEST_BUILD_NAME                    "CTestTest-Linux-g++-ZeroTimeout")

set(CTEST_SOURCE_DIRECTORY              "/home/jovyan/cmake-3.15.2/Tests/CTestTestZeroTimeout")
set(CTEST_BINARY_DIRECTORY              "/home/jovyan/cmake-3.15.2/Tests/CTestTestZeroTimeout")
set(CTEST_CVS_COMMAND                   "CVSCOMMAND-NOTFOUND")
set(CTEST_CMAKE_GENERATOR               "Unix Makefiles")
set(CTEST_CMAKE_GENERATOR_PLATFORM      "")
set(CTEST_CMAKE_GENERATOR_TOOLSET       "")
set(CTEST_BUILD_CONFIGURATION           "$ENV{CMAKE_CONFIG_TYPE}")
set(CTEST_COVERAGE_COMMAND              "/usr/bin/gcov")
set(CTEST_NOTES_FILES                   "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")
set(CTEST_TEST_TIMEOUT                  2)

CTEST_START(Experimental)
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
CTEST_TEST(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)