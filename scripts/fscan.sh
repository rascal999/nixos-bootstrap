#!/usr/bin/env bash

if [[ "$#" -ne "2" ]]; then
    echo "fscan <IP> <URL>"
    echo "Example: fscan 10.0.0.1 http://10.0.0.1:1337"
    exit 1
fi

IP=$1
URL=$2

tmux kill-session -t fscan
tmux new-session -d -s fscan
tmux split-window -v -t fscan:0.0
tmux split-window -v -t fscan:0.1
tmux split-window -v -t fscan:0.0
tmux send-keys -t fscan:0.0 "d-rustscan $IP" Enter
tmux send-keys -t fscan:0.1 "d-nikto $URL" Enter
tmux send-keys -t fscan:0.2 "d-dirb $URL" Enter
tmux send-keys -t fscan:0.3 "d-whatweb $URL" Enter
tmux attach-session -t fscan
