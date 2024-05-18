vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO huhuang03/QtAwesome
    REF "${VERSION}"
    SHA512 09434d94f6de7681a58b052742f66cd50c05ba385535ffda25775a35f13b571d62c5a9864b9348ea20e1fdaaea2e21c9be75f657332b586a9abc791f88114253  # This is a temporary value. We will modify this value in the next section.
    HEAD_REF master
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME QtAwesome CONFIG_PATH lib/cmake/QtAwesome)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)