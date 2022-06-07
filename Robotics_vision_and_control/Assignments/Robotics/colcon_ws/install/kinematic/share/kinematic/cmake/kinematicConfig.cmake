# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_kinematic_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED kinematic_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(kinematic_FOUND FALSE)
  elseif(NOT kinematic_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(kinematic_FOUND FALSE)
  endif()
  return()
endif()
set(_kinematic_CONFIG_INCLUDED TRUE)

# output package information
if(NOT kinematic_FIND_QUIETLY)
  message(STATUS "Found kinematic: 0.0.0 (${kinematic_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'kinematic' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${kinematic_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(kinematic_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${kinematic_DIR}/${_extra}")
endforeach()
