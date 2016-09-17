# CMakeLists file for DIPlib 3.0

cmake_minimum_required (VERSION 3.5.2) # It might work with older versions, but this is the version I'm testing with.

project (DIPlib)

if(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()


# Safe gcc compiler and architecture flags across all Intel and AMD processors (circa 2015)

set(CMAKE_CXX_FLAGS "-std=c++11 -Wall -Wno-c++14-extensions")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -mavx -mavx2 -msse2 -mfma -mbmi")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")
set(CMAKE_INSTALL_RPATH "$ORIGIN")


# MATLAB

set(MATLAB_ADDITIONAL_VERSIONS "R2016a=9.0") # This is necessary because my version of MATLAB is very recent and my version of CMake is not. Ajust as necessary.
find_package(Matlab OPTIONAL_COMPONENTS MX_LIBRARY)


# DIPlib library

include_directories(include)

file(GLOB SOURCES
   "src/*/*.h"
   "src/*/*.cpp"
   )

file(GLOB HEADERS
   "include/*.h"
   )

#add_library(DIP DYNAMIC ${SOURCES} ${HEADERS}) # Why does this not work any more? What changed?
add_library(DIP STATIC ${SOURCES} ${HEADERS})


# DIPlib tests

add_executable(test_array EXCLUDE_FROM_ALL test/test_array.cpp)
add_executable(test_bin EXCLUDE_FROM_ALL test/test_bin.cpp)
add_executable(test_options EXCLUDE_FROM_ALL test/test_options.cpp)
add_executable(test_physdims EXCLUDE_FROM_ALL test/test_physdims.cpp)
add_executable(test_image EXCLUDE_FROM_ALL test/test_image.cpp)
target_link_libraries(test_image DIP)
add_executable(test_framework EXCLUDE_FROM_ALL test/test_framework.cpp)
target_link_libraries(test_framework DIP)

add_custom_target(tests DEPENDS test_array test_bin test_options test_physdims test_image test_framework)

if(Matlab_FOUND)

   matlab_add_mex(NAME mextest SRC test/mextest.cpp LINK_TO DIP)
   set_target_properties(mextest PROPERTIES EXCLUDE_FROM_ALL 1)

   matlab_add_mex(NAME mextest_function SRC test/mextest_function.cpp LINK_TO DIP)
   set_target_properties(mextest_function PROPERTIES EXCLUDE_FROM_ALL 1)

   add_custom_target(mex DEPENDS mextest mextest_function)

endif(Matlab_FOUND)

# DIPlib documentation

find_package(Doxygen)

if (DOXYGEN_FOUND)

   set(DOXYGEN_INPUT Doxyfile)
   set(DOXYGEN_OUTPUT doc)

   add_custom_command(
      OUTPUT ${DOXYGEN_OUTPUT}
      COMMAND ${CMAKE_COMMAND} -E echo_append "Building API Documentation..."
      COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_INPUT}
      COMMAND ${CMAKE_COMMAND} -E echo "Done."
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      DEPENDS ${DOXYGEN_INPUT}
      )

   add_custom_target(apidoc DEPENDS ${DOXYGEN_OUTPUT})

endif (DOXYGEN_FOUND)