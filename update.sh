#!/bin/bash

git status
read -p "Commit and push changes? [y/n]: " -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]; then
	git add . && git commit -am "Auto commit on $(date --utc +'%c')" && git push
else
	echo "No action"
fi

