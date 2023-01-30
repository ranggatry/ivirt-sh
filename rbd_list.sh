#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        n) poolname=${OPTARG};;
    esac
done

echo "Pool Name: $poolname";
echo "exec rbd ls ${poolname}";

bash -c "exec rbd ls ${poolname}";
