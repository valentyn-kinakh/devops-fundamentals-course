#!/bin/bash

filename='users.db'

if [ $1 = "add" ]; then
  echo "Enter user name:"
  read name
  echo "Enter user role:"
  select role in manager developer QA
  do
  echo "You have chosen $role"
  echo "$name ,$role" >> $filename;
  exit
  done
elif [ $1 = 'backup' ]; then
  echo $1
elif [[ $1 = "" || $1 = "help" ]]; then
  echo "--add adds user to user.db file"
  echo "--backup creates back up file"
  echo "--restore Takes the last created backup file and replaces users.db with it. If there are no backups - script should print:
  No backup file found"
  echo "--find prompts the user to type a username, then prints username and role if such exists in users.db"
  echo "--list prints all users"
fi
