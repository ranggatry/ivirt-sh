#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        g) veth_name_ovs=${OPTARG};;
        n) veth_name=${OPTARG};;
    esac
done

echo "Veth Name Ovs: $veth_name_ovs";
echo "Veth Name: $veth_name";
echo "exec ip link add ${veth_name_ovs} type veth peer name ${veth_name}";

bash -c "exec ip link add ${veth_name_ovs} type veth peer name ${veth_name}";
