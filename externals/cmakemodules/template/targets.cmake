# ${not} generated file

if(NOT PHYSX_CURRENT_BINARY_DIR)
    set(PHYSX_CURRENT_BINARY_DIR "${__CMAKE_CURRENT_LIST_DIR}")
endif()

if(${PX_GENERATE_STATIC_LIBRARIES})
    add_library(PhysX::PhysX STATIC IMPORTED)
    set_target_properties(PhysX::PhysX PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysX_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
    target_link_libraries(PhysX::PhysX INTERFACE -ldl -pthread)
else()
    add_library(PhysX::PhysX SHARED IMPORTED)
    set_target_properties(PhysX::PhysX PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_SHARED_LIBRARY_PREFIX}PhysX${EXE_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}"
        IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysX${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
endif()
target_include_directories(PhysX::PhysX INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

if(${PX_GENERATE_STATIC_LIBRARIES})
    add_library(PhysX::Common STATIC IMPORTED)
    set_target_properties(PhysX::Common PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXCommon_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
else()
    add_library(PhysX::Common SHARED IMPORTED)
    set_target_properties(PhysX::Common PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_SHARED_LIBRARY_PREFIX}PhysXCommon${EXE_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}"
        IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXCommon${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
endif()
target_include_directories(PhysX::Common INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

if(${PX_GENERATE_STATIC_LIBRARIES})
    add_library(PhysX::Foundation STATIC IMPORTED)
    set_target_properties(PhysX::Foundation PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXFoundation_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
else()
    add_library(PhysX::Foundation SHARED IMPORTED)
    set_target_properties(PhysX::Foundation PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_SHARED_LIBRARY_PREFIX}PhysXFoundation${EXE_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}"
        IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXFoundation${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
endif()
target_include_directories(PhysX::Foundation INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Extensions STATIC IMPORTED)
set_target_properties(PhysX::Extensions PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXExtensions_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
)
target_include_directories(PhysX::Extensions INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Task STATIC IMPORTED)
set_target_properties(PhysX::Task PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXTask_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
)
target_include_directories(PhysX::Task INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Vehicle STATIC IMPORTED)
set_target_properties(PhysX::Vehicle PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXVehicle_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
)
target_include_directories(PhysX::Vehicle INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Cooking STATIC IMPORTED)
set_target_properties(PhysX::Cooking PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXCooking_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
)
if(${PX_GENERATE_STATIC_LIBRARIES})
    add_library(PhysX::Cooking STATIC IMPORTED)
    set_target_properties(PhysX::Cooking PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXCooking_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
else()
    add_library(PhysX::Cooking SHARED IMPORTED)
    set_target_properties(PhysX::Cooking PROPERTIES
        IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_SHARED_LIBRARY_PREFIX}PhysXCooking${EXE_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}"
        IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXCooking${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
    )
endif()
target_include_directories(PhysX::Cooking INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::CharacterKinematic STATIC IMPORTED)
set_target_properties(PhysX::CharacterKinematic PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXCharacterKinematic_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
)
target_include_directories(PhysX::CharacterKinematic INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::PvdSDK STATIC IMPORTED)
set_target_properties(PhysX::PvdSDK PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}PhysXPvdSDK_static${EXE_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}"
)
target_include_directories(PhysX::PvdSDK INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)