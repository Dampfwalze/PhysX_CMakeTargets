# Options:
#   PHYSX_PRESET:
#       Either one of the presets defined by PhysX at <PhysX_root>/physx/buildtools/presets/public,
#       specified with its filename without extension or a user defined preset, specified with its path.
#       Default is "vc17win64"
#   PHYSX_CONFIG:
#       The compile configuration to use. debug, checked, profile and release can be used.
#       Default is "checked"
#   PHYSX_BUILD_PARALLEL_LEVEL:
#       The parallel level that will be passed to the PhysX build step. Valid format: [-j or --parallel] <Number>
#   PYTHON_COMMAND:
#       Where to find python, default is "python"

if(NOT PHYSX_PRESET)
    if(WIN32)
        set(PHYSX_PRESET vc17win64)
    else()
        set(PHYSX_PRESET linux)
    endif()
endif()

if(NOT PHYSX_CONFIG)
    set(PHYSX_CONFIG checked)
endif()

string(TOUPPER ${PHYSX_CONFIG} PHYSX_CONFIG_UPPER_CASE)

if(PHYSX_BUILD_PARALLEL_LEVEL)
    if("${PHYSX_BUILD_PARALLEL_LEVEL}" MATCHES "^[0-9]+$")
        set(PHYSX_BUILD_PARALLEL_LEVEL -j${PHYSX_BUILD_PARALLEL_LEVEL})
    elseif(NOT "${PHYSX_BUILD_PARALLEL_LEVEL}" MATCHES "(-j|--parallel)\\s*[0-9]+$")
        message(FATAL_ERROR "Value \"${PHYSX_BUILD_PARALLEL_LEVEL}\" for PHYSX_BUILD_PARALLEL_LEVEL is invalid. Valid format: [-j or --parallel] <Number>")
    endif()
endif()

if(NOT PYTHON_COMMAND)
    # check if python is installed and can be run
    execute_process(
        COMMAND python --version
        RESULT_VARIABLE PYTHON_VERSION_RESULT
        OUTPUT_VARIABLE PYTHON_VERSION_OUTPUT
    )

    if(NOT "${PYTHON_VERSION_RESULT}" EQUAL 0)
        execute_process(
            COMMAND python3 --version
            RESULT_VARIABLE PYTHON_VERSION_RESULT
            OUTPUT_VARIABLE PYTHON_VERSION_OUTPUT
        )

        if(NOT "${PYTHON_VERSION_RESULT}" EQUAL 0)
            message(FATAL_ERROR "python cannot be found on the System, please make sure to install python or specify its path with PYTHON_COMMAND")
        endif()
        set(PYTHON_COMMAND python3)
    else()
        set(PYTHON_COMMAND python)
    endif()
endif()

if(WIN32)
    set(PHYSX_PROJECT_GENERATOR "${CMAKE_CURRENT_LIST_DIR}/physx/generate_projects.bat")
else()
    set(PHYSX_PROJECT_GENERATOR "${CMAKE_CURRENT_LIST_DIR}/physx/generate_projects.sh")
endif()

# get preset name from xml file
# set(ENV{PYTHONIOENCODING} utf_8)
execute_process(
    COMMAND "${PYTHON_COMMAND}" "parse_preset.py" "${PHYSX_PRESET}"
    RESULT_VARIABLE PHYSX_PARSE_PRESET_RESULT
    OUTPUT_VARIABLE PHYSX_PARSE_PRESET_OUTPUT
    WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}"
)

if(NOT ${PHYSX_PARSE_PRESET_RESULT} EQUAL 0)
    message(FATAL_ERROR "Value \"${PHYSX_PRESET}\" for PHYSX_PRESET cannot be found")
endif()

message("PHYSX_PARSE_PRESET_OUTPUT: ${PHYSX_PARSE_PRESET_OUTPUT}")
list(GET PHYSX_PARSE_PRESET_OUTPUT 0 PHYSX_PRESET_NAME)
list(GET PHYSX_PARSE_PRESET_OUTPUT 1 TARGET_BUILD_PLATFORM)

if(${TARGET_BUILD_PLATFORM} MATCHES "linux|linuxAarch64|android")
    set(PHYSX_CONFIGURE_DIR "${CMAKE_CURRENT_LIST_DIR}/physx/compiler/${PHYSX_PRESET_NAME}-${PHYSX_CONFIG}")
else()
    set(PHYSX_CONFIGURE_DIR "${CMAKE_CURRENT_LIST_DIR}/physx/compiler/${PHYSX_PRESET_NAME}")
endif()

# Configure PhysX
message("------ Starting PhysX configure step ------")
get_filename_component(PYTHON_COMMAND_DIR "${PYTHON_COMMAND}" DIRECTORY)
set(ENV{PM_python_PATH} "${PYTHON_COMMAND_DIR}")
set(ENV{PM_python_COMMAND} "${PYTHON_COMMAND}")

execute_process(
    COMMAND "${PHYSX_PROJECT_GENERATOR}" "${PHYSX_PRESET}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/physx"
    RESULT_VARIABLE PHYSX_CONFIGURE_RESULT
)

if(NOT "${PHYSX_CONFIGURE_RESULT}" EQUAL 0)
    message(FATAL_ERROR "PhysX configure step failed:\n${PHYSX_CONFIGURE_RESULT}")
endif()

message("------ PhysX configure step successful ------")

include("${PHYSX_CONFIGURE_DIR}/cached.cmake")

set(PHYSX_CURRENT_BINARY_DIR "${PX_EXE_OUTPUT_DIRECTORY_${PHYSX_CONFIG_UPPER_CASE}}")

include("${PHYSX_CONFIGURE_DIR}/targets.cmake")

# Build PhysX
add_custom_command(
    OUTPUT "${PHYSX_CURRENT_BINARY_DIR}/targets.cmake"
    COMMAND "${CMAKE_COMMAND}" --build "${PHYSX_CONFIGURE_DIR}" ${PHYSX_BUILD_PARALLEL_LEVEL} --config ${PHYSX_CONFIG}
)

add_custom_target(PhysX_Build DEPENDS "${PHYSX_CURRENT_BINARY_DIR}/targets.cmake")

add_dependencies(PhysX::PhysX PhysX_Build)