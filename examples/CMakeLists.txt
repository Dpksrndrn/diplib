set(CMAKE_BUILD_WITH_INSTALL_RPATH 0) # Allow running these in the build directory -- they're not installed anyway

# An example program that demonstrates different ways of doing per-pixel arithmetic
add_executable(image_arithmetic image_arithmetic.cpp)
target_link_libraries(image_arithmetic DIP)

# An example program that demonstrates how to register a new measurement feature in dip::MeasurementTool
add_executable(register_measurement_feature register_measurement_feature.cpp)
target_link_libraries(register_measurement_feature DIP)

# A program that times dilations with different structuring element shapes and sizes
add_executable(time_dilations time_dilations.cpp)
target_link_libraries(time_dilations DIP)

# A program that shows the difference between dip::VarianceAccumulator and dip::FastVarianceAccumulator
add_executable(variance variance.cpp)
target_link_libraries(variance DIP)

# A program to compute the fractal dimension of an input image
add_executable(fractal_dimension fractal_dimension.cpp)
target_link_libraries(fractal_dimension DIP)

# This is a simple program that replicates the dip::RadialMean function
add_executable(radial_mean radial_mean.cpp)
target_compile_definitions(radial_mean PRIVATE DIP__EXAMPLES_DIR="${CMAKE_CURRENT_LIST_DIR}")
target_link_libraries(radial_mean DIP)

if(DIP_BUILD_DIPVIEWER)

# A test program that demonstrates some of the low-level functionality of DIPviewer
add_executable(viewer viewer.cpp)
target_compile_definitions(viewer PRIVATE DIP__EXAMPLES_DIR="${CMAKE_CURRENT_LIST_DIR}")
target_link_libraries(viewer DIP DIPviewer Threads::Threads)

# An example program that does simple image manipulation and uses dip::viewer::ShowSimple
add_executable(display display.cpp)
target_compile_definitions(display PRIVATE DIP__EXAMPLES_DIR="${CMAKE_CURRENT_LIST_DIR}")
target_link_libraries(display DIP DIPviewer)

# A simple tool that shows an image file using dip::viewer::Show
add_executable(fileviewer fileviewer.cpp)
target_link_libraries(fileviewer DIP DIPviewer)

# An example program that shows how to delete small objects from a grey-value image, and use dip::viewer::ShowSimple
add_executable( select_objects select_objects.cpp )
target_link_libraries(select_objects DIP DIPviewer)

endif(DIP_BUILD_DIPVIEWER)

# A program to time functions with and without multithreading, useful to fine-tune the cost value that determines
# for what size image it is worth using multithreading.
add_executable(time_openmp time_openmp.cpp)
target_link_libraries(time_openmp DIP)

# A program that tests the binary morphology functions
add_executable(test_binary test_binary.cpp)
target_compile_definitions(test_binary PRIVATE DIP__EXAMPLES_DIR="${CMAKE_CURRENT_LIST_DIR}")
target_link_libraries(test_binary DIP)

# The `examples` target builds them all
add_custom_target(examples DEPENDS
      image_arithmetic
      register_measurement_feature
      time_dilations
      variance
      fractal_dimension
      radial_mean
      time_openmp
      test_binary
)

if(DIP_BUILD_DIPVIEWER)

add_dependencies(examples
      viewer
      display
      fileviewer
      select_objects
)

endif(DIP_BUILD_DIPVIEWER)