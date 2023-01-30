#!/usr/bin/env bash

while getopts g:n: flag
do
    case "${flag}" in
        g) image_id=${OPTARG};;
        n) poolname=${OPTARG};;
    esac
done

echo "Image Id: $image_id";
echo "Pool Name: $poolname";
echo "exec rbd trash restore ${poolname}/${image_id}";

bash -c "exec rbd trash restore ${poolname}/${image_id}";
