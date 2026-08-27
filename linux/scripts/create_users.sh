#!/bin/bash
department="$1"
MAX="$2"

if (($# != 2)) 
then
        echo "Error: exatcly two arguments are required"
        echo "Usage: $0 <department> <number>"
        exit 1
fi
if ! getent group "$department" > /dev/null
then
        echo "Error: group '$department' does not exist"
        exit 1
fi

if ! [[ "$MAX" =~ ^[0-9]+$ ]]
then
        echo "Error: MAX must be a number"
        exit 1
fi

if ((MAX > 20 || MAX < 1))
then
        echo "Error: You can create between 1 and 20 users"
        exit 1
fi

for ((number=1; number<=MAX; number++))
do
        formatted=$(printf "%02d" "$number")
        user="$department$formatted"

        if id "$user" > /dev/null 2>$1
        then
                echo "User already exist"
        else
                sudo useradd -m -g "$department" "$user"
                echo "Created user $user"
        fi
done

exit 0
