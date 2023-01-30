#!/usr/bin/env bash

while getopts g:n:f:m: flag
do
    case "${flag}" in
        g) group=${OPTARG};;
        n) name=${OPTARG};;
        f) folder=${OPTARG};;
        m) map=${OPTARG};;
    esac
done

echo "umount ${folder}";
bash -c "umount ${folder}";

echo "rmdir ${folder}";
bash -c "rmdir ${folder}";

echo "dmsetup remove ${map}";
bash -c "dmsetup remove ${map}";

echo "exec yes | lvremove ${group}/${name}";
bash -c "exec yes | lvremove ${group}/${name}";