#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) bridge_name=${OPTARG};;
    esac
done

echo "Bridge Name: $bridge_name";
echo "exec brctl addbr ${bridge_name} && ip link set dev ${bridge_name} up";

bash -c "exec brctl addbr ${bridge_name} && ip link set dev ${bridge_name} up";
