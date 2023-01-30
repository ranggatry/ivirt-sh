#!/usr/bin/env bash

while getopts i:l:s: flag
do
    case "${flag}" in
        i) imagefilepath=${OPTARG};;
        l) lvpath=${OPTARG};;
        s) size=${OPTARG};;
    esac
done

echo "Image File Path: $imagefilepath";
echo "LV Path: $lvpath";
echo "Size: $size";
echo "exec dd if=${imagefilepath} bs=${size}M iflag=direct | /usr/bin/pigz | dd of=${lvpath} bs=${size}M status=progress";

bash -c "exec dd if=${imagefilepath} bs=${size}M iflag=direct | /usr/bin/pigz | dd of=${lvpath} bs=${size}M status=progress";