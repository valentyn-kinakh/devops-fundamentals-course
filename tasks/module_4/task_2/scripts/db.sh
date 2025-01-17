#!/bin/bash

filename='../data/users.db'

if [ $1 = "add" ]; then
  echo "Enter user name:"
  read name
  echo "Enter user role:"
  select role in manager developer QA; do
    echo "You have chosen $role"
    echo "$name ,$role" >>$filename
    exit
  done
elif [ $1 = 'backup' ]; then
  today=$(date +"%Y-%m-%d")
  cp $filename "../data/$today-users.db.backup"
elif [ $1 = 'restore' ]; then
  find "../data/" -type f -name '[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]*' -print0 | xargs -0 ls -tl | head -1 | awk '{print $NF}' | xargs cat >$filename
elif [ $1 = "find" ]; then
  echo "Enter user name:"
  read name
  while read -r line; do
    if [[ "$line" == *"$name"* ]]; then
      echo "$line"
    fi
  done <"$filename"
elif [[ $1 = "list" && $2 != "--inverse" ]]; then
  while read -r line; do
    echo "$line"
  done < "$filename"
elif [[ $1 = "list" && $2 = "--inverse" ]]; then
  cat $filename | tac
elif [[ $1 = "" || $1 = "help" ]]; then
  echo "--add adds user to user.db file"
  echo "--backup creates back up file"
  echo "--restore Takes the last created backup file and replaces users.db with it. If there are no backups - script should print:
  No backup file found"
  echo "--find prompts the user to type a username, then prints username and role if such exists in users.db"
  echo "--list prints all users"
fi
