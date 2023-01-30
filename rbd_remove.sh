#!/usr/bin/env bash

while getopts g:n: flag
do
    case "${flag}" in
        g) image=${OPTARG};;
        n) poolname=${OPTARG};;
    esac
done

echo "Image Name: $image";
echo "Pool Name: $poolname";
echo "exec rbd rm ${poolname}/${image}";

bash -c "exec rbd rm ${poolname}/${image}";
