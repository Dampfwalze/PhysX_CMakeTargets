# ${not} generated file

add_library(PhysX::PhysX SHARED IMPORTED)
set_target_properties(PhysX::PhysX PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysX_${ARCH}.dll"
    IMPORTED_IMPLIB "${CURR_DIR}/PhysX_${ARCH}.lib"
)
target_include_directories(PhysX::PhysX INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Common SHARED IMPORTED)
set_target_properties(PhysX::Common PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXCommon_${ARCH}.dll"
    IMPORTED_IMPLIB "${CURR_DIR}/PhysXCommon_${ARCH}.lib"
)
target_include_directories(PhysX::Common INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Foundation SHARED IMPORTED)
set_target_properties(PhysX::Foundation PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXFoundation_${ARCH}.dll"
    IMPORTED_IMPLIB "${CURR_DIR}/PhysXFoundation_${ARCH}.lib"
)
target_include_directories(PhysX::Foundation INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Extensions STATIC IMPORTED)
set_target_properties(PhysX::Extensions PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXExtensions_static_${ARCH}.lib"
)
target_include_directories(PhysX::Extensions INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Task STATIC IMPORTED)
set_target_properties(PhysX::Task PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXTask_static_${ARCH}.lib"
)
target_include_directories(PhysX::Task INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Vihicle STATIC IMPORTED)
set_target_properties(PhysX::Vihicle PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXVihicle_static_${ARCH}.lib"
)
target_include_directories(PhysX::Vihicle INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::Cooking STATIC IMPORTED)
set_target_properties(PhysX::Cooking PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXCooking_static_${ARCH}.lib"
)
target_include_directories(PhysX::Cooking INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::CharacterKinematic STATIC IMPORTED)
set_target_properties(PhysX::CharacterKinematic PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXCharacterKinematic_static_${ARCH}.lib"
)
target_include_directories(PhysX::CharacterKinematic INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)

add_library(PhysX::PvdSDK STATIC IMPORTED)
set_target_properties(PhysX::PvdSDK PROPERTIES
    IMPORTED_LOCATION "${CURR_DIR}/PhysXPvdSDK_static_${ARCH}.lib"
)
target_include_directories(PhysX::PvdSDK INTERFACE
    "${PHYSX_ROOT_DIR}/include"
    "${CMAKE_BINARY_DIR}/include"
    "${PXSHARED_PATH}/include"
)