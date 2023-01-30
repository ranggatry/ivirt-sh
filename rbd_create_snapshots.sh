#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) image=${OPTARG};;
        n) poolname=${OPTARG};;
        s) snapname=${OPTARG};;
    esac
done

echo "Image Name: $image";
echo "Pool Name: $poolname";
echo "Snap Name: $snapname";
echo "exec rbd snap create ${poolname}/${image}@${snapname}";

bash -c "exec rbd snap create ${poolname}/${image}@${snapname}";
