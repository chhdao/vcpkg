# Download File From Github
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO chhdao/baseee
    REF 64e7ed6cb9faec690fd155c5f90e21277e09fef9
    SHA512 c40167aa796040fa7108dccec1db30bdfdfc885e59a0cd1ea96446eb0a60a10f245c958cf316eee3e67c2bfc20e554bc1396fc6250993a8d1f1f683e18a72342
    HEAD_REF master
)

#Build
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/baseee
    PREFER_NINJA 
)
               
vcpkg_install_cmake()

vcpkg_copy_pdbs()

# Add License
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/baseee/copyright)

# do something
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
SET(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")