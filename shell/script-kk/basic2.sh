# This script creates a backup of a given file by creating a copy as bkp
# For example some-file is backed up as some-file_bkp

# Enable the "exit immediately" option
set -e
# Any command that fails (exits with a non-zero status) after this point will cause the script to exit immediately

file_name=$1

cp $file_name ${file_name}_bkp

echo "Done"