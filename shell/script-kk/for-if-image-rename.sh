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