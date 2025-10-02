# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/src/ase-3.2.20-9007ca2745.clean;C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg")
set(CPACK_CMAKE_GENERATOR "Ninja")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "C:/Users/marco/AppData/Local/vcpkg/downloads/tools/cmake-3.30.1-windows/cmake-3.30.1-windows-i386/share/cmake-3.30/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "SDL3 built using CMake")
set(CPACK_GENERATOR "ZIP")
set(CPACK_INNOSETUP_ARCHITECTURE "x64")
set(CPACK_INSTALL_CMAKE_PROJECTS "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg;SDL3;ALL;/")
set(CPACK_INSTALL_PREFIX "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/pkgs/sdl3_x64-windows/debug")
set(CPACK_MODULE_PATH "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/src/ase-3.2.20-9007ca2745.clean/cmake")
set(CPACK_NSIS_DISPLAY_NAME "SDL3 3.2.20")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES64")
set(CPACK_NSIS_PACKAGE_NAME "SDL3 3.2.20")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "C:/Users/marco/AppData/Local/vcpkg/downloads/tools/cmake-3.30.1-windows/cmake-3.30.1-windows-i386/share/cmake-3.30/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "SDL3 built using CMake")
set(CPACK_PACKAGE_DIRECTORY "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg/dist")
set(CPACK_PACKAGE_FILE_NAME "SDL3-3.2.20-win64")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "SDL3 3.2.20")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "SDL3 3.2.20")
set(CPACK_PACKAGE_NAME "SDL3")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Humanity")
set(CPACK_PACKAGE_VERSION "3.2.20")
set(CPACK_PACKAGE_VERSION_MAJOR "3")
set(CPACK_PACKAGE_VERSION_MINOR "2")
set(CPACK_PACKAGE_VERSION_PATCH "20")
set(CPACK_PROJECT_CONFIG_FILE "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg/CPackProjectConfig.cmake")
set(CPACK_RESOURCE_FILE_LICENSE "C:/Users/marco/AppData/Local/vcpkg/downloads/tools/cmake-3.30.1-windows/cmake-3.30.1-windows-i386/share/cmake-3.30/Templates/CPack.GenericLicense.txt")
set(CPACK_RESOURCE_FILE_README "C:/Users/marco/AppData/Local/vcpkg/downloads/tools/cmake-3.30.1-windows/cmake-3.30.1-windows-i386/share/cmake-3.30/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "C:/Users/marco/AppData/Local/vcpkg/downloads/tools/cmake-3.30.1-windows/cmake-3.30.1-windows-i386/share/cmake-3.30/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_7Z "ON")
set(CPACK_SOURCE_GENERATOR "7Z;ZIP")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "SDL3-3.2.20-src")
set(CPACK_SOURCE_ZIP "ON")
set(CPACK_SYSTEM_NAME "win64")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "win64")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/x64-windows/vcpkg/blds/sdl3/x64-windows-dbg/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
