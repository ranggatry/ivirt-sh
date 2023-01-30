#!/usr/bin/env bash

while getopts g:n:s: flag
do
    case "${flag}" in
        n) domainname=${OPTARG};;
    esac
done


bash -c "exec virt-df -h -d ${domainname}";
