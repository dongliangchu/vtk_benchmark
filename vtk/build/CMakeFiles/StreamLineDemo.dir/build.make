# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dongliang/StreamLine

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dongliang/StreamLine/build

# Include any dependencies generated for this target.
include CMakeFiles/StreamLineDemo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/StreamLineDemo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/StreamLineDemo.dir/flags.make

CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o: CMakeFiles/StreamLineDemo.dir/flags.make
CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o: ../StreamLine.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dongliang/StreamLine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o -c /home/dongliang/StreamLine/StreamLine.cxx

CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dongliang/StreamLine/StreamLine.cxx > CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.i

CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dongliang/StreamLine/StreamLine.cxx -o CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.s

CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.requires:

.PHONY : CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.requires

CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.provides: CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.requires
	$(MAKE) -f CMakeFiles/StreamLineDemo.dir/build.make CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.provides.build
.PHONY : CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.provides

CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.provides.build: CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o


# Object files for target StreamLineDemo
StreamLineDemo_OBJECTS = \
"CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o"

# External object files for target StreamLineDemo
StreamLineDemo_EXTERNAL_OBJECTS =

StreamLineDemo: CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o
StreamLineDemo: CMakeFiles/StreamLineDemo.dir/build.make
StreamLineDemo: /usr/local/lib/libvtkIOLegacy-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkFiltersFlowPaths-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkFiltersSources-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkIOCore-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkFiltersCore-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkCommonExecutionModel-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkCommonDataModel-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkCommonMisc-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkCommonTransforms-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkCommonMath-7.1.so.1
StreamLineDemo: /usr/local/lib/libvtkCommonCore-7.1.so.1
StreamLineDemo: CMakeFiles/StreamLineDemo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dongliang/StreamLine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable StreamLineDemo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/StreamLineDemo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/StreamLineDemo.dir/build: StreamLineDemo

.PHONY : CMakeFiles/StreamLineDemo.dir/build

CMakeFiles/StreamLineDemo.dir/requires: CMakeFiles/StreamLineDemo.dir/StreamLine.cxx.o.requires

.PHONY : CMakeFiles/StreamLineDemo.dir/requires

CMakeFiles/StreamLineDemo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/StreamLineDemo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/StreamLineDemo.dir/clean

CMakeFiles/StreamLineDemo.dir/depend:
	cd /home/dongliang/StreamLine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dongliang/StreamLine /home/dongliang/StreamLine /home/dongliang/StreamLine/build /home/dongliang/StreamLine/build /home/dongliang/StreamLine/build/CMakeFiles/StreamLineDemo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/StreamLineDemo.dir/depend

