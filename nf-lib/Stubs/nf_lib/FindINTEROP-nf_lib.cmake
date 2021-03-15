#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#

########################################################################################
# make sure that a valid path is set bellow                                            #
# this is an Interop module so this file should be placed in the CMakes module folder  #
# usually CMake\Modules                                                                #
########################################################################################

# native code directory
set(BASE_PATH_FOR_THIS_MODULE ${PROJECT_SOURCE_DIR}/InteropAssemblies/nf_lib)


# set include directories
list(APPEND nf_lib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Core)
list(APPEND nf_lib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Include)
list(APPEND nf_lib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/HAL/Include)
list(APPEND nf_lib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/PAL/Include)
list(APPEND nf_lib_INCLUDE_DIRS ${BASE_PATH_FOR_THIS_MODULE})


# source files
set(nf_lib_SRCS

    nf_lib.cpp


    nf_lib_nf_lib_Display_LiquidCrystal_I2C_mshl.cpp
    nf_lib_nf_lib_Display_LiquidCrystal_I2C.cpp

)

foreach(SRC_FILE ${nf_lib_SRCS})
    set(nf_lib_SRC_FILE SRC_FILE-NOTFOUND)
    find_file(nf_lib_SRC_FILE ${SRC_FILE}
        PATHS
	        ${BASE_PATH_FOR_THIS_MODULE}
	        ${TARGET_BASE_LOCATION}
            ${PROJECT_SOURCE_DIR}/src/nf_lib

	    CMAKE_FIND_ROOT_PATH_BOTH
    )
    # message("${SRC_FILE} >> ${nf_lib_SRC_FILE}") # debug helper
    list(APPEND nf_lib_SOURCES ${nf_lib_SRC_FILE})
endforeach()

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(nf_lib DEFAULT_MSG nf_lib_INCLUDE_DIRS nf_lib_SOURCES)
