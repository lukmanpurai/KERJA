#!/bin/bash

gpu_info=$(nvidia-smi --query-gpu=name --format=csv,noheader)
gpu_count=$(echo "$gpu_info" | wc -l)
gpu_model=$(echo "$gpu_info" | head -n 1 | grep -oP '\d{4}')  # 提取型號中的數字部分

vastname=$(cat ~/.vast_containerlabel)
vastname_last8=$(echo "$vastname" | tail -c 9)  # 包括前面的 "_" 符號
MACHINE="CLB"

if [ -f "aleo_prover-v0.1.3_stable.tar.gz" ]; then
    echo "File already exists. Skipping download."
else
    wget -O https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/cuda-v0.2.5-hotfix2/aleo_prover-v0.2.5_cuda_full_hotfix2.tar.gz
    tar -zvxf aleo_prover-v0.2.5_cuda_full_hotfix2.tar.gz
fi

# Check if the address parameter is provided, set default if not
address=${1:-aleo1dvfqqldvawz5fx9w5c72mkywyq2d0qkr85sa304376k3nww9pv8sm69370}

# Define your command
command="/root/aleo_prover/aleo_prover --pool 161.35.100.9:443 --address $address --custom_name $MACHINE"

# Display the final command
echo "Final command: $command"

# Start the command initially
$command &

# Short delay before the first check
sleep 10

# Monitoring loop
while true; do
    # Check if the process is running
    if ! pgrep -f "$command" > /dev/null; then
        echo "Process has stopped, restarting..."
        $command &
    fi
    # Check every 60 seconds
    sleep 60
done
