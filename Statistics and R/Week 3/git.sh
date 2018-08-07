#!/bin/bash
git add *
echo -n "Enter your message:"
read message
git commit -m "$message" 
git push origin master
