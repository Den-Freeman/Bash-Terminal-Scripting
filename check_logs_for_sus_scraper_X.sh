#!/bin/bash

# Define the log file to check
LOG_FILE="/var/log/nginx/access.log"

# Define the number of times we consider an action "repetitive"
REPETITIVE_THRESHOLD=5

# Define the time window for repetitive actions in seconds
TIME_WINDOW=60

# Function to check for repetitive access
check_repetitive_access() {
    local ip=$1
    local url=$2

    # Count occurrences of the IP accessing the URL within the time window
    count=$(awk -v ip="$ip" -v url="$url" -v window="$TIME_WINDOW" '
        BEGIN { 
            count = 0; 
            last_time = 0 
        }
        { 
            if ($1 == ip && $7 == url) {
                time = mktime($4 " " $5);
                if (time - last_time <= window) {
                    count++
                } else {
                    count = 1
                }
                last_time = time
            }
        }
        END { print count }
    ' "$LOG_FILE")

    if [ "$count" -ge "$REPETITIVE_THRESHOLD" ]; then
        echo "Warning: IP $ip accessed $url $count times in $TIME_WINDOW seconds."
    fi
}

# Process each line in the log
while IFS= read -r line; do
    # Extract IP and URL from each log entry (assuming common log format)
    ip=$(echo "$line" | awk '{print $1}')
    url=$(echo "$line" | awk '{print $7}')
    
    # Check for repetitive access
    check_repetitive_access "$ip" "$url"
done < "$LOG_FILE"

echo "Log analysis completed."
