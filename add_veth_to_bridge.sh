#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) bridge_name=${OPTARG};;
        n) veth_name=${OPTARG};;
    esac
done

echo "Bridge Name: $bridge_name";
echo "Veth Name: $veth_name";
echo "exec brctl addif ${bridge_name} ${veth_name}";

bash -c "exec brctl addif ${bridge_name} ${veth_name}";
