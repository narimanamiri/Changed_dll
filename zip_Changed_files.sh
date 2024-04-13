#!/bin/bash

# Specify the directory containing the DLL files
dll_dir="path/to/dll/dir"

# Specify the directory to copy changed DLL files
changed_dll_dir="path/to/changed/dir"

# Specify the file containing the stored MD5 hashes
hash_file="dll_hashes.txt"

# Specify the name of the zip file
zip_file="path/to/changed/dir/changed_dlls_$(date +'%y%m%d_%H-%M').zip"

# Calculate the current MD5 hashes of DLL files
current_hashes=$(find "$dll_dir" -type f -name "*.dll" -exec md5sum {} +)

# Compare the current hashes with the stored hashes
while IFS="  " read -r hash file; do
    if [[ $(echo "$current_hashes" | grep "$file" | cut -d ' ' -f1) != "$hash" ]]; then
        cp "$dll_dir/$file" "$changed_dll_dir"
        echo "Copied $file to $changed_dll_dir"
    fi
done < "$hash_file"

# Zip the changed DLL files
zip -r "$zip_file" "$changed_dll_dir"

echo "Changed DLL files have been zipped to $zip_file"
