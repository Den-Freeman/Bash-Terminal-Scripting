#!/bin/bash   
echo "Give a directory name to create:"    
read NEW_DIR    
ORIG_DIR=$(pwd)    
[[ -d $NEW_DIR ]] && echo $NEW_DIR already exists, aborting && exit    
mkdir  $NEW_DIR    
cd $NEW_DIR    
pwd    
for n in 9 8 7 6 5 4 3 2 1 0    
do        
touch file$n    
done

ls file?    

for names in file?    
do       
echo This file is named $names > $names    
done

cat file?

cd $ORIG_DIR

rm -rf $NEW_DIR

echo "Goodbye"
