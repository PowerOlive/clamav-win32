file(GLOB curl_srcs ${3RDPARTY}/curl/lib/*.c ${3RDPARTY}/curl/lib/*/*.c)
add_library(curl STATIC ${curl_srcs})
target_include_directories(curl PRIVATE ${3RDPARTY}/curl/include ${3RDPARTY}/curl/lib ${3RDPARTY}/pthreads)
target_compile_definitions(curl PRIVATE
    BUILDING_LIBCURL
    CURL_STATICLIB
    CURL_DISABLE_LDAP
    USE_OPENSSL
    HAVE_PTHREAD_H
    USE_THREADS_POSIX)

if(MINGW)
    target_compile_definitions(curl PRIVATE _WIN32_WINNT=0x400)
endif()
