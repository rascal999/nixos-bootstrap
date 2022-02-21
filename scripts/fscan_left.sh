#!/usr/bin/env bash

if [[ "$#" -ne "2" ]]; then
    echo "fscan <IP> <URL>"
    echo "Example: fscan 10.0.0.1 http://10.0.0.1:1337"
    exit 1
fi

IP=$1
URL=$2

tmux kill-session -t fscan_left
tmux new-session -d -s fscan_left
tmux split-window -v -p 20 -t fscan_left:0.0
tmux split-window -v -p 50 -t fscan_left:0.0
tmux send-keys -t fscan_left:0.0 "d-nmap -sU -T5 $IP" Enter
tmux send-keys -t fscan_left:0.1 "d-dirb $URL" Enter
tmux send-keys -t fscan_left:0.2 "d-whatweb $URL" Enter
tmux attach-session -t fscan_left
