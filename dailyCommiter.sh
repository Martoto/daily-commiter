#!/bin/bash

# Default values
remove_flag=false
file_path="./quotes.txt"
frequency=1  

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

if [ "$frequency" -gt 0 ]; then
  interval=$((24 / frequency))
  cron_schedule="*/$interval * * * *"
else
  echo "Invalid frequency: $frequency" >&2
  exit 1
fi

(crontab -l 2>/dev/null; echo "$cron_schedule /home/changeit/Code/10xProgrammer/dailyCommiter.sh") | crontab -

if [ "$remove_flag" = true ]; then
    crontab -l | grep -v "/home/changeit/Code/10xProgrammer/dailyCommiter.sh" | crontab -
    echo "Script removed from cron."
    exit 0
fi

current_day=$(date +"%A")
full_date_time=$(date +"%Y-%m-%d %H:%M:%S")

quote="I will become a 10xProgrammer someday! For now I'm just pretending to be one¡"

commit_message="Commit on $current_day, ($full_date_time): $quote"

echo "$commit_message" >> "$file_path"

git add .

git commit -m "$commit_message"