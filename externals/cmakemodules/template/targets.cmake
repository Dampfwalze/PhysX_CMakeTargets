# ${not} generated file

if(NOT PHYSX_CURRENT_BINARY_DIR)
    set(PHYSX_CURRENT_BINARY_DIR "${__CMAKE_CURRENT_LIST_DIR}")
endif()

add_library(PhysX::PhysX SHARED IMPORTED)
set_target_properties(PhysX::PhysX PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysX${EXE_SUFFIX}.dll"
    IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/PhysX${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::PhysX INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Common SHARED IMPORTED)
set_target_properties(PhysX::Common PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXCommon${EXE_SUFFIX}.dll"
    IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/PhysXCommon${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::Common INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Foundation SHARED IMPORTED)
set_target_properties(PhysX::Foundation PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXFoundation${EXE_SUFFIX}.dll"
    IMPORTED_IMPLIB "${PHYSX_CURRENT_BINARY_DIR}/PhysXFoundation${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::Foundation INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Extensions STATIC IMPORTED)
set_target_properties(PhysX::Extensions PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXExtensions_static${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::Extensions INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Task STATIC IMPORTED)
set_target_properties(PhysX::Task PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXTask_static${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::Task INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Vihicle STATIC IMPORTED)
set_target_properties(PhysX::Vihicle PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXVihicle_static${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::Vihicle INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Cooking STATIC IMPORTED)
set_target_properties(PhysX::Cooking PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXCooking_static${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::Cooking INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::CharacterKinematic STATIC IMPORTED)
set_target_properties(PhysX::CharacterKinematic PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXCharacterKinematic_static${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::CharacterKinematic INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::PvdSDK STATIC IMPORTED)
set_target_properties(PhysX::PvdSDK PROPERTIES
    IMPORTED_LOCATION "${PHYSX_CURRENT_BINARY_DIR}/PhysXPvdSDK_static${EXE_SUFFIX}.lib"
)
target_include_directories(PhysX::PvdSDK INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)