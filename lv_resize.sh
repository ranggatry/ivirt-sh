#!/usr/bin/env bash

while getopts s:m: flag
do
    case "${flag}" in
        s) size=${OPTARG};;
        m) map=${OPTARG};;
    esac
done

echo "exec yes | lvresize -L ${size} ${map}";
bash -c "exec yes | lvresize -L ${size} ${map}";