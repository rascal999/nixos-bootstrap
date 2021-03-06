#!/usr/bin/env bash

if [[ "$#" -ne "1" ]]; then
    echo "wscan <IP>"
    echo "Example: wscan 10.0.0.1"
    exit 1
fi

IP=$1
URL=$2

tmux kill-session -t wscan_right
tmux new-session -d -s wscan_right
tmux split-window -v -p 20 -t wscan_right:0.0
tmux split-window -v -p 50 -t wscan_right:0.0
tmux send-keys -t wscan_right:0.0 "d-rpcclient $IP" Enter
tmux send-keys -t wscan_right:0.1 "d-samrdump $IP" Enter
tmux send-keys -t wscan_right:0.2 "d-smbclient $IP" Enter
#tmux send-keys -t wscan_right:0.2 "d-rpcdump $IP" Enter
tmux attach-session -t wscan_right
