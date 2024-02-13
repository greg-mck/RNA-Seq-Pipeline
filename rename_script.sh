#!/bin/bash

# Set the source and destination directories
source_dir="../01_input/QUO1007029/Illumina RNA Reads"
destination_dir="../01_input/QUO1007029/Illumina RNA Reads"


# Loop through the source directory for .fastq files
for fname in "$source_dir"/*.fastq; do
    # Check if the file exists and is a regular file
    if [ -f "$fname" ]; then
        # Modify the file name
        name="${fname%\.*}"
        extension="${fname#$name}"

        # Replace "_R1_001" with "_1" and "_R2_001" with "_2"
        newname="${name//_R1_001/_1}"
        newname="${newname//_R2_001/_2}"

        newfname="$newname""$extension"

        # Check if the file name needs to be changed
        if [ "$fname" != "$newfname" ]; then
            # Print the renaming command to the console
            echo mv "$fname" "$newfname"

            # Execute the renaming command
            mv "$fname" "$newfname"
        fi
    fi
done

echo "Renaming complete."