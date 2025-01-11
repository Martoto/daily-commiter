#!/bin/bash

# Get the current day
current_day=$(date +"%A")

# Get a random quote
quote=$(curl -s https://api.quotable.io/random | jq -r '.content')

# Combine the day and quote into a commit message
commit_message="Commit on $current_day: $quote"

# Add all changes to git
git add .

# Commit with the generated message
git commit -m "$commit_message"