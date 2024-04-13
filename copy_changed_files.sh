#!/bin/bash

# Specify the directory containing the DLL files
dll_dir="./"

# Specify the directory to copy changed DLL files
changed_dll_dir="./changed"

# Specify the file containing the stored MD5 hashes
hash_file="dll_hashes.txt"

# Calculate the current MD5 hashes of DLL files
current_hashes=$(find "$dll_dir" -type f -name "*.dll" -exec md5sum {} +)

# Compare the current hashes with the stored hashes
while IFS="  " read -r hash file; do
    if [[ $(echo "$current_hashes" | grep "$file" | cut -d ' ' -f1) != "$hash" ]]; then
        cp "$dll_dir/$file" "$changed_dll_dir"
        echo "Copied $file to $changed_dll_dir"
    fi
done < "$hash_file"
