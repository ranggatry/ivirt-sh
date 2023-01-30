#!/usr/bin/env bash

while getopts i:l:s: flag
do
    case "${flag}" in
        i) filepath=${OPTARG};;
        l) lvpath=${OPTARG};;
        s) size=${OPTARG};;
    esac
done

echo "File Path: $filepath";
echo "LV Path: $lvpath";
echo "Size: $size";
echo "exec /usr/bin/pigz -dc ${filepath} | dd of=${lvpath} bs=${size}M status=progress";

bash -c "/usr/bin/pigz -dc ${filepath} | dd of=${lvpath} bs=${size}M status=progress";
