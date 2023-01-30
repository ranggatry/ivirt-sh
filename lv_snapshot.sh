#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) group=${OPTARG};;
        n) name=${OPTARG};;
        s) size=${OPTARG};;
    esac
done

echo "LV Group: $group";
echo "LV Name: $name";
echo "Size: $size";
echo "exec lvcreate -L ${size} -s -n ${name} ${group}";

bash -c "exec lvcreate -L ${size} -s -n ${name} ${group}";
