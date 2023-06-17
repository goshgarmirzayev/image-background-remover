#!/bin/bash

# Check if a directory is provided as a parameter
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Assign the directory parameter to a variable
directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

# Create the 'removed-dir' if it doesn't exist
removed_dir="$directory/removed-dir"
mkdir -p "$removed_dir"

# Iterate over files in the directory
for file in "$directory"/*; do
  if [ -f "$file" ]; then
    # Extract the filename without the directory path
    filename=$(basename "$file")

    # Run the python script for background removal
    python3 background remover -i "$file" -o "$removed_dir/$filename"
  fi
done
