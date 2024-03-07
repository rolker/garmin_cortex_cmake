find_package(PkgConfig)
pkg_check_modules(PC_GarminCortex QUIET GarminCortex)

find_path(GarminCortex_INCLUDE_DIR
  NAMES VHFoIP.h
  PATHS ${PC_GarminCortex_INCLUDE_DIRS}
  PATH_SUFFIXES garmin_cortex
)

find_library(GarminCortex_LIBRARY
  NAMES vesper-vhfoip-sdk
  PATHS ${PC_GarminCortex_LIBRARY_DIRS}
)

set(GarminCortex_VERSION 2.1)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GarminCortex
  FOUND_VAR GarminCortex_FOUND
  REQUIRED_VARS
    GarminCortex_LIBRARY
    GarminCortex_INCLUDE_DIR
  VERSION_VAR GarminCortex_VERSION
)
