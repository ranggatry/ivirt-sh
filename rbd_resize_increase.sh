#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) image=${OPTARG};;
        n) poolname=${OPTARG};;
        s) size=${OPTARG};;
    esac
done

echo "Image Name: $image";
echo "Pool Name: $poolname";
echo "Size: $size";
echo "exec rbd resize --size ${size} ${poolname}/${image}";

bash -c "exec rbd resize  --size ${size} ${poolname}/${image}";
