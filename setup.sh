#!/bin/bash

protoc --cpp_out=vector_tile_spec/out/ vector_tile_spec/2.1/vector_tile.proto
mv vector_tile_spec/out/vector_tile_spec/2.1/vector_tile.pb.cc libs/vector_tile21/vector_tile.pb.cc
mv vector_tile_spec/out/vector_tile_spec/2.1/vector_tile.pb.h libs/vector_tile21/vector_tile.pb.h