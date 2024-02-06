# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# This config sets the following variables in your project::
#
#   ArrowCUDA_FOUND - true if Arrow CUDA found on the system
#
# This config sets the following targets in your project::
#
#   ArrowCUDA::arrow_cuda_shared - for linked as shared library if shared library is built
#   ArrowCUDA::arrow_cuda_static - for linked as static library if static library is built


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was ArrowCUDAConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include(CMakeFindDependencyMacro)
find_dependency(Arrow)
if(CMAKE_VERSION VERSION_LESS 3.17)
  find_package(CUDA REQUIRED)
  add_library(ArrowCUDA::cuda_driver SHARED IMPORTED)
  set_target_properties(ArrowCUDA::cuda_driver
                        PROPERTIES IMPORTED_LOCATION "${CUDA_CUDA_LIBRARY}"
                                   INTERFACE_INCLUDE_DIRECTORIES "${CUDA_INCLUDE_DIRS}")
else()
  find_package(CUDAToolkit REQUIRED)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/ArrowCUDATargets.cmake")

arrow_keep_backward_compatibility(ArrowCUDA arrow_cuda)

check_required_components(ArrowCUDA)

arrow_show_details(ArrowCUDA ARROW_CUDA)
