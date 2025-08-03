#!/bin/bash

LOG_FILE="access.log"

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found!"
    exit 1
fi

# Extract IP addresses and count occurrences
echo "=== Unique IP addresses ==="
awk '{if($1 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $1}' "$LOG_FILE" | sort -u

echo -e "\n=== Count of requests per IP (descending) ==="
awk '{if($1 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $1}' "$LOG_FILE" \
    | sort | uniq -c | sort -nr

# IP with most requests
echo -e "\n=== IP address with most requests ==="
awk '{if($1 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $1}' "$LOG_FILE" \
    | sort | uniq -c | sort -nr | head -1

# Extract endpoints safely (handle malformed lines)
echo -e "\n=== All unique endpoints ==="
awk '{for(i=1;i<=NF;i++){if($i ~ /^\//){print $i}}}' "$LOG_FILE" | sort -u

# Count requests per endpoint and sort ascending
echo -e "\n=== Endpoint request count (ascending) ==="
awk '{for(i=1;i<=NF;i++){if($i ~ /^\//){print $i}}}' "$LOG_FILE" \
    | sort | uniq -c | sort -n