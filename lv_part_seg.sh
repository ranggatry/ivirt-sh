#!/bin/bash

while getopts g:n: flag
do
    case "${flag}" in
        g) group=${OPTARG};;
        n) path=${OPTARG};;
    esac
done

echo "sfdisk  ${group}/${path} -uS --force";
#bash -c "exec 2048,,83,*\0,0\0,0\0,0\EOF | sfdisk  ${group}/${path} -uS --force << EOF";
#bash -c "exec sfdisk  ${group}/${path} -uS --force << EOF
#2048,,83,*
#0,0
#0,0
#0,0
#EOF"
sfdisk  ${group}/${path} --force << EOF
2048,,83,*
0,0
0,0
0,0
EOF