#!/bin/bash

if [ ! -d "./vcpkg" ] 
then
    # https://github.com/microsoft/vcpkg/releases
    git clone https://github.com/microsoft/vcpkg.git
    cd ./vcpkg
    git checkout 2022.08.15
    ./bootstrap-vcpkg.sh
    cd ..
fi