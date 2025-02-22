cmake_minimum_required(VERSION 3.14)
project(pyck)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Python
find_package(PythonLibs REQUIRED)
include_directories(${PYTHON_INCLUDE_PATH})

# Find OpenMP
find_package(OpenMP REQUIRED)

# Add subdirectories for internal modules
add_subdirectory(pack)
add_subdirectory(shapes)
add_subdirectory(writers)

# Create pyck library
add_library(pyck 
    pack/pack.cpp 
    shapes/shape.cpp
    shapes/boundingBox.cpp
    writers/writer.cpp
    intField.cpp
    doubleField.cpp
    model.cpp
    progressBar.cpp
)

# Include directories
target_include_directories(pyck PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Link dependencies
target_link_libraries(pyck 
    pack 
    shape 
    boundingBox 
    writer 
    intField 
    doubleField 
    model 
    progressBar 
    OpenMP::OpenMP_CXX
)

# Install rules
install(TARGETS pyck DESTINATION lib)
install(FILES ${CMAKE_BINARY_DIR}/swig/pyck.py DESTINATION lib)

# Add SWIG bindings
add_subdirectory(swig)

include(CPack)