#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) image=${OPTARG};;
        n) poolname=${OPTARG};;
    esac
done

echo "Image Name: $image";
echo "Pool Name: $poolname";
echo "exec rbd snap ls ${poolname}/${image}";

bash -c "exec rbd snap ls ${poolname}/${image}";
