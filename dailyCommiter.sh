#!/bin/bash

# Default values
remove_flag=false
file_path="/home/changeit/Code/10xProgrammer/quotes.txt"
frequency=1  # Default frequency: once per day

# Get the path to the script
script_path=$(realpath "$0")

# Function to display help message
show_help() {
    echo "Usage: $0 [-r] [-f file_path] [-t frequency] [-h]"
    echo "  -r              Remove the script from cron jobs"
    echo "  -f file_path    Specify a custom file path for storing commit messages"
    echo "  -t frequency    Set the frequency of commits per day (e.g., -t 2 for twice per day)"
    echo "  -h              Display this help message"
    echo "  -c commit       Commits to file"
}

# Function to commit
commit() {
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
}


# Parse command-line options
while getopts ":rf:t:h:c" opt; do
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
    h)
      show_help
      exit 0
      ;;
    c)
      commit
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_help
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      show_help
      exit 1
      ;;
  esac
done

# Check if the remove flag is set
if [ "$remove_flag" = true ]; then
    # Remove this script from cron
    crontab -l | grep -v "$script_path" | crontab -
    echo "Script removed from cron."
    exit 0
else
    # Calculate the cron schedule based on the frequency
    if [ "$frequency" -gt 0 ]; then
      interval=$((24 / frequency))
      cron_schedule="*/$interval * * * *"
    else
      echo "Invalid frequency: $frequency" >&2
      exit 1
    fi

    # Check if the cron job already exists
    if crontab -l | grep -q "$script_path"; then
      echo "Cron job already exists."
    else
      # Add this script to cron if not already added
    (crontab -l 2>/dev/null; echo "$cron_schedule $script_path -c"; echo "@reboot $script_path -c") | crontab -
      echo "Cron job added."
    fi
fi

