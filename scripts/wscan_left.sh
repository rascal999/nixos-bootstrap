#!/usr/bin/env bash

if [[ "$#" -ne "1" ]]; then
    echo "wscan <IP>"
    echo "Example: wscan 10.0.0.1"
    exit 1
fi

IP=$1
URL=$2

tmux kill-session -t wscan_left
tmux new-session -d -s wscan_left
tmux split-window -v -p 20 -t wscan_left:0.0
tmux split-window -v -p 50 -t wscan_left:0.0
tmux send-keys -t wscan_left:0.0 "d-enum4linux $IP" Enter
tmux send-keys -t wscan_left:0.1 "d-nbtscan $IP" Enter
tmux send-keys -t wscan_left:0.2 "d-nmap-smb $IP" Enter
tmux attach-session -t wscan_left
