if(__FIND_CXX11_CMAKE__)
    return()
endif()
set(__FIND_CXX11_CMAKE__ TRUE)

include(CheckCXXCompilerFlag)
enable_language(CXX)

if(MSVC)
    set(COMPILER_KNOWS_CXX11 TRUE)
else()
    check_cxx_compiler_flag("-std=c++11" COMPILER_KNOWS_CXX11)

    if(COMPILER_KNOWS_CXX11)
        add_compile_options(-std=c++11)

        check_cxx_compiler_flag("-stdlib=libc++" COMPILER_KNOWS_STDLIB)
        if(APPLE AND COMPILER_KNOWS_STDLIB)
            add_compile_options(-stdlib=libc++)
        endif()
    endif()
endif()

if(NOT COMPILER_KNOWS_CXX11)
    message(FATAL_ERROR "Your C++ compiler does not support C++11.")
endif()