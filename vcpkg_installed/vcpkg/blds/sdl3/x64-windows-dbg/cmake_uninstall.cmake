if (NOT EXISTS "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/vcpkg/blds/sdl3/x64-windows-dbg/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/vcpkg/blds/sdl3/x64-windows-dbg/install_manifest.txt\"")
endif()

file(READ "C:/Users/marco/Documents/avans/schooljaar 25_26/Project/box2d_poc/vcpkg_installed/vcpkg/blds/sdl3/x64-windows-dbg/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    execute_process(
        COMMAND C:/Program Files/Microsoft Visual Studio/2022/Enterprise/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/bin/cmake.exe -E remove "$ENV{DESTDIR}${file}"
        OUTPUT_VARIABLE rm_out
        RESULT_VARIABLE rm_retval
    )
    if(NOT ${rm_retval} EQUAL 0)
        message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif (NOT ${rm_retval} EQUAL 0)
endforeach()
