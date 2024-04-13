#!/bin/bash

# Specify the directory containing the DLL files
dll_dir="path/to/dll/directory"

# Specify the output file to store the MD5 hashes
output_file="dll_hashes.txt"

# Find all DLL files in the directory and calculate their MD5 hashes
find "$dll_dir" -type f -name "*.dll" -exec md5sum {} + > "$output_file"

echo "MD5 hashes of DLL files have been saved to $output_file"
