cmake_minimum_required(VERSION 3.5.1)
project(mbtilesCpp)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        cppGzip/DecodeGzip.cpp
        cppGzip/DecodeGzip.h
        cppGzip/EncodeGzip.cpp
        cppGzip/EncodeGzip.h
        cppGzip/HandleDeflate.h
        libs/MBTileReader/MBTileReader.cpp
        libs/MBTileReader/MBTileReader.h
        libs/VectorTile/VectorTile.cpp
        libs/VectorTile/VectorTile.h)

include(FindProtobuf)

add_library(mbtilesCpp ${SOURCE_FILES})
target_include_directories(mbtilesCpp PUBLIC ${Protobuf_INCLUDE_DIR})
target_link_libraries(mbtilesCpp sqlite3 z)
target_link_libraries(mbtilesCpp ${PROTOBUF_LIBRARIES})
