# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/enriqueharo/github/kompililo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/enriqueharo/github/kompililo/build

# Include any dependencies generated for this target.
include CMakeFiles/kompililo.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/kompililo.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/kompililo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/kompililo.dir/flags.make

CMakeFiles/kompililo.dir/codegen:
.PHONY : CMakeFiles/kompililo.dir/codegen

CMakeFiles/kompililo.dir/src/main.cpp.o: CMakeFiles/kompililo.dir/flags.make
CMakeFiles/kompililo.dir/src/main.cpp.o: /Users/enriqueharo/github/kompililo/src/main.cpp
CMakeFiles/kompililo.dir/src/main.cpp.o: CMakeFiles/kompililo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/enriqueharo/github/kompililo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/kompililo.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/kompililo.dir/src/main.cpp.o -MF CMakeFiles/kompililo.dir/src/main.cpp.o.d -o CMakeFiles/kompililo.dir/src/main.cpp.o -c /Users/enriqueharo/github/kompililo/src/main.cpp

CMakeFiles/kompililo.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/kompililo.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/enriqueharo/github/kompililo/src/main.cpp > CMakeFiles/kompililo.dir/src/main.cpp.i

CMakeFiles/kompililo.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/kompililo.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/enriqueharo/github/kompililo/src/main.cpp -o CMakeFiles/kompililo.dir/src/main.cpp.s

# Object files for target kompililo
kompililo_OBJECTS = \
"CMakeFiles/kompililo.dir/src/main.cpp.o"

# External object files for target kompililo
kompililo_EXTERNAL_OBJECTS =

kompililo: CMakeFiles/kompililo.dir/src/main.cpp.o
kompililo: CMakeFiles/kompililo.dir/build.make
kompililo: CMakeFiles/kompililo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/enriqueharo/github/kompililo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable kompililo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kompililo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/kompililo.dir/build: kompililo
.PHONY : CMakeFiles/kompililo.dir/build

CMakeFiles/kompililo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/kompililo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/kompililo.dir/clean

CMakeFiles/kompililo.dir/depend:
	cd /Users/enriqueharo/github/kompililo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/enriqueharo/github/kompililo /Users/enriqueharo/github/kompililo /Users/enriqueharo/github/kompililo/build /Users/enriqueharo/github/kompililo/build /Users/enriqueharo/github/kompililo/build/CMakeFiles/kompililo.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/kompililo.dir/depend

