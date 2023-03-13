#!/bin/bash

threshold=${1:-10000000000000}

total_free_space=$(df -h | awk '{sum += $7} END {print sum}')

# Check if the free space is below the threshold
if (($(echo "$total_free_space < $threshold" | bc -l))); then
  echo "Warning: Free disk space below threshold of $threshold KB"
fi

# Show the total free space
echo "Total free space: $total_free_space KB"
