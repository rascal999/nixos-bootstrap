#!/usr/bin/env bash

if [[ "$#" -ne "2" ]]; then
    echo "fscan <IP> <URL>"
    echo "Example: fscan 10.0.0.1 http://10.0.0.1:1337"
    exit 1
fi

IP=$1
URL=$2

tmux kill-session -t fscan_right
tmux new-session -d -s fscan_right
tmux split-window -v -p 33 -t fscan_right:0.0
tmux split-window -v -p 50 -t fscan_right:0.1
tmux send-keys -t fscan_right:0.2 "d-nmap -sU -T5 $IP" Enter
tmux send-keys -t fscan_right:0.3 "d-whatweb $URL" Enter
tmux attach-session -t fscan_right
