#!/bin/bash

# Add this script to cron if not already added
(crontab -l 2>/dev/null; echo "0 9 * * * /home/changeit/Code/10xProgrammer/dailyCommiter.sh") | crontab -

# Check if the script was called with the "remove" argument
if [ "$1" == "remove" ]; then
    # Remove this script from cron
    crontab -l | grep -v "/home/changeit/Code/10xProgrammer/dailyCommiter.sh" | crontab -
    echo "Script removed from cron."
    exit 0
fi

# Get the current day
current_day=$(date +"%A")
full_date_time=$(date +"%Y-%m-%d %H:%M:%S")


# Get a random quote
quote="I will become a 10xProgrammer someday! For now im just pretending to be one¡"

# Combine the day and quote into a commit message
commit_message="Commit on $current_day, ($full_date_time): $quote"

# Define the file path
file_path="/home/changeit/Code/10xProgrammer/quotes.txt"

# Append the quote to the file
echo "$quote" >> "$file_path"


# Add all changes to git
git add .

# Commit with the generated message
git commit -m "$commit_message"