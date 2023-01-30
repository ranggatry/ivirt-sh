#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        n) poolname=${OPTARG};;
    esac
done

echo "Volume Name: $volume";
echo "exec rbd trash ls ${poolname}";

bash -c "exec rbd trash ls ${poolname}";
