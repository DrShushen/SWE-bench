#!/bin/bash

# Determine the directory where this script is located
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# File containing the list of environments to keep, located in the same directory as the script
except_file="$script_dir/rm_conda_envs__except.txt"

# Read the list of environments to keep into an array
mapfile -t keep_envs < "$except_file"

# Get all conda environments
all_envs=$(conda env list | awk '{print $1}' | grep -v '#' | grep -v 'base')

# Loop through all environments and remove those not in the keep list
for env in $all_envs; do
    if [[ ! " ${keep_envs[*]} " =~ " $env " ]]; then
        echo "Removing environment: $env"
        conda env remove -n $env -y
    else
        echo "Skipping environment: $env"
    fi
done

conda clean --all -y

echo "Cleanup complete."
