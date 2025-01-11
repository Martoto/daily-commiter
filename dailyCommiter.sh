#!/bin/bash

# Default values
remove_flag=false
file_path="/home/changeit/Code/10xProgrammer/quotes.txt"
frequency=1  # Default frequency: once per day

# Parse command-line options
while getopts ":rf:t:" opt; do
  case $opt in
    r)
      remove_flag=true
      ;;
    f)
      file_path=$OPTARG
      ;;
    t)
      frequency=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Calculate the cron schedule based on the frequency
if [ "$frequency" -gt 0 ]; then
  interval=$((24 / frequency))
  cron_schedule="*/$interval * * * *"
else
  echo "Invalid frequency: $frequency" >&2
  exit 1
fi

# Add this script to cron if not already added
(crontab -l 2>/dev/null; echo "$cron_schedule /home/changeit/Code/10xProgrammer/dailyCommiter.sh") | crontab -

# Check if the remove flag is set
if [ "$remove_flag" = true ]; then
    # Remove this script from cron
    crontab -l | grep -v "/home/changeit/Code/10xProgrammer/dailyCommiter.sh" | crontab -
    echo "Script removed from cron."
    exit 0
fi

# Get the current day
current_day=$(date +"%A")
full_date_time=$(date +"%Y-%m-%d %H:%M:%S")

# Get a random quote
quote="I will become a 10xProgrammer someday! For now I'm just pretending to be one¡"

# Combine the day and quote into a commit message
commit_message="Commit on $current_day, ($full_date_time): $quote"

# Append the quote to the file
echo "$commit_message" >> "$file_path"

# Add all changes to git
git add .

# Commit with the generated message
git commit -m "$commit_message"