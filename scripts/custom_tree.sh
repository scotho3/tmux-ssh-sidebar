#!/usr/bin/env bash

# find . -path '*/.git*' -prune -o -print |
# 	sed -e 's;[^/]*/;|___;g;s;___|; |;g'

<<<<<<< HEAD
find_host() {
=======
find_host() = {
>>>>>>> 33bc4f3f665c07940b6d22874a9d81b973c7c6e8

host=$(grep -e "^Host " ~/.ssh/network | awk '{print $2}' | grep -v "\*" | fzf)
if [ -z $host ]
then
		return 1
else
		echo "SSH session started, connecting to" $host
		ssh $host
fi

}

while :; do find_host; sleep 1; done
