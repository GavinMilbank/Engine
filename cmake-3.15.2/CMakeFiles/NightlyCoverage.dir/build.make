# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/jovyan/cmake-3.15.2/Bootstrap.cmk/cmake

# The command to remove a file.
RM = /home/jovyan/cmake-3.15.2/Bootstrap.cmk/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jovyan/cmake-3.15.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jovyan/cmake-3.15.2

# Utility rule file for NightlyCoverage.

# Include the progress variables for this target.
include CMakeFiles/NightlyCoverage.dir/progress.make

CMakeFiles/NightlyCoverage:
	CMAKE_CTEST_COMMAND-NOTFOUND -D NightlyCoverage

NightlyCoverage: CMakeFiles/NightlyCoverage
NightlyCoverage: CMakeFiles/NightlyCoverage.dir/build.make

.PHONY : NightlyCoverage

# Rule to build all files generated by this target.
CMakeFiles/NightlyCoverage.dir/build: NightlyCoverage

.PHONY : CMakeFiles/NightlyCoverage.dir/build

CMakeFiles/NightlyCoverage.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/NightlyCoverage.dir/cmake_clean.cmake
.PHONY : CMakeFiles/NightlyCoverage.dir/clean

CMakeFiles/NightlyCoverage.dir/depend:
	cd /home/jovyan/cmake-3.15.2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jovyan/cmake-3.15.2 /home/jovyan/cmake-3.15.2 /home/jovyan/cmake-3.15.2 /home/jovyan/cmake-3.15.2 /home/jovyan/cmake-3.15.2/CMakeFiles/NightlyCoverage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/NightlyCoverage.dir/depend
