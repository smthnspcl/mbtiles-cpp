#!/bin/bash

git submodule update --init --recursive --remote

if [ ! -d "libs/vector_tile21" ]; then
    mkdir libs/vector_tile21
fi

if [ ! -d "vector_tile_spec" ]; then
    mkdir vector_tile_spec
fi

cd vector_tile_spec

if [ ! -f "vector_tile.proto" ]; then
    wget https://raw.githubusercontent.com/mapbox/vector-tile-spec/master/2.1/vector_tile.proto
fi

sed '3d' vector_tile.proto > vt.proto
rm vector_tile.proto
mv vt.proto vector_tile.proto

if [ ! -d "out" ]; then
    mkdir out
fi

if [ ! -f "out/vector_tile.pb.cc" ]; then
    protoc --cpp_out=out/ vector_tile.proto
    mv out/vector_tile.pb.cc ../libs/vector_tile21/vector_tile.pb.cc
    mv out/vector_tile.pb.h ../libs/vector_tile21/vector_tile.pb.h
fi
