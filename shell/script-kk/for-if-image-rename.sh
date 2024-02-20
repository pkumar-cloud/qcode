<< com
Rename all files within the images folder that has extension jpeg to jpg. 
A file with any other extension should remain the same.
com

for file in $(ls images)
do
        if [[ $file = *.jpeg ]]
                then
                new_name=$(echo $file| sed 's/jpeg/jpg/g')
                mv images/$file images/$new_name
        fi
done

#Improved version
#!/bin/bash

# Use globbing directly in the for loop to iterate over jpeg files in the 'images' directory
for file in images/*.jpeg; do
    # Check if the file exists and is a regular file
    if [[ -f "$file" ]]; then
        # Use parameter expansion to replace 'jpeg' with 'jpg' in the file name
        new_name="${file/%jpeg/jpg}"
        # Move the file to its new name
        mv "$file" "$new_name"
    fi
done
