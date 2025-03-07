$grep OS updates.txt

$ls /home/analyst/reports | grep users

$ls /home/analyst/reports/users | grep Q1
$ls | grep Q1
(if you are already in the dir)

$ls /home/analyst/reports/users | grep access
$grep "Human Resources" Q4_added_users.txt

$find /home/analyst/projects
#Searches for everything starting at the /projects directory

$find /home/analyst/projects -name "*log*"
$find /home/analyst/projects -iname "*log*"
#The difference between these two options is that -name is case-sensitive, and -iname is not. 
#One key criteria analysts might use with find is to find file or directory names that contain a specific string.

#Note: An asterisk (*) is used as a wildcard to represent zero or more unknown characters.

$find /home/analyst/projects -mtime -3
returns all files and directories in the projects directory that have been modified within the past three days.

$chmod o-w project_k.txt
#Change the permissions of the file identified in the previous step so that the owner type of other doesn’t have write permissions.

$sudo chown researcher9 /home/researcher2/projects/project_r.txt
#Use the chown command to make researcher9 the owner of /home/researcher2/projects/project_r.txt

$sudo userdel researcher9
$sudo groupdel researcher9
#(always need to make sure you ALSO DELETE THE GROUP, after you have deleted the user!!!!)

#!/bin/bash
#Creates a new variable with a value of "Hello World"
learningbash="Hello World"
echo $learningbash

#!/bin/bash
n=0
while :
do
echo Countdown: $n
((n++))
done

