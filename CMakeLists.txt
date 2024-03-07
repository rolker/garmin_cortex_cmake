cmake_minimum_required(VERSION 3.16.3)

project(garmin_cortex_sdk)

set (cortex_sdk_dir ${CMAKE_CURRENT_SOURCE_DIR}/Cortex-VHFoIP-SDK-v2.1)
set (cortex_sdk_lib_name libvesper-vhfoip-sdk.so)
set (cortex_sdk_lib ${cortex_sdk_dir}/src/${cortex_sdk_lib_name})

add_custom_target(cortex_sdk ALL
  COMMAND make sdk
  BYPRODUCTS ${cortex_sdk_lib}
  WORKING_DIRECTORY ${cortex_sdk_dir}
)

install(DIRECTORY ${cortex_sdk_dir}/include/
  DESTINATION include/garmin_cortex
)

install(FILES ${cortex_sdk_lib}
  DESTINATION lib
)

install(FILES GarminCortexConfig.cmake
  DESTINATION lib/cmake/GarminCortex
)