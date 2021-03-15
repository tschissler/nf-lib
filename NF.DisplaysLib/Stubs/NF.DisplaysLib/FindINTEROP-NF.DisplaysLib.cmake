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
set(BASE_PATH_FOR_THIS_MODULE ${PROJECT_SOURCE_DIR}/InteropAssemblies/NF.DisplaysLib)


# set include directories
list(APPEND NF.DisplaysLib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Core)
list(APPEND NF.DisplaysLib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Include)
list(APPEND NF.DisplaysLib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/HAL/Include)
list(APPEND NF.DisplaysLib_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/PAL/Include)
list(APPEND NF.DisplaysLib_INCLUDE_DIRS ${BASE_PATH_FOR_THIS_MODULE})


# source files
set(NF.DisplaysLib_SRCS

    NF_DisplaysLib.cpp


    NF_DisplaysLib_nf_lib_Display_LiquidCrystal_I2C_mshl.cpp
    NF_DisplaysLib_nf_lib_Display_LiquidCrystal_I2C.cpp

)

foreach(SRC_FILE ${NF.DisplaysLib_SRCS})
    set(NF.DisplaysLib_SRC_FILE SRC_FILE-NOTFOUND)
    find_file(NF.DisplaysLib_SRC_FILE ${SRC_FILE}
        PATHS
	        ${BASE_PATH_FOR_THIS_MODULE}
	        ${TARGET_BASE_LOCATION}
            ${PROJECT_SOURCE_DIR}/src/NF.DisplaysLib

	    CMAKE_FIND_ROOT_PATH_BOTH
    )
    # message("${SRC_FILE} >> ${NF.DisplaysLib_SRC_FILE}") # debug helper
    list(APPEND NF.DisplaysLib_SOURCES ${NF.DisplaysLib_SRC_FILE})
endforeach()

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(NF.DisplaysLib DEFAULT_MSG NF.DisplaysLib_INCLUDE_DIRS NF.DisplaysLib_SOURCES)
