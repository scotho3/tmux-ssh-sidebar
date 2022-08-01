#!/usr/bin/env bash

# find . -path '*/.git*' -prune -o -print |
# 	sed -e 's;[^/]*/;|___;g;s;___|; |;g'

find_host() {

host=$(grep -e "^Host " ~/.ssh/network | awk '{print $2}' | grep -v "\*" | fzf)
if [ -z $host ]
then
		return 1
else
		echo "SSH session started, connecting to" $host
		tmux send-keys -t ! "ssh $host" C-m
		tmux select-pane -t !
fi

}

while :; do find_host; sleep 1; done
