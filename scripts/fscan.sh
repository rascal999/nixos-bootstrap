#!/usr/bin/env bash

tmux kill-session -t fscan
tmux new-session -d -s fscan
tmux split-window -v -t fscan:0.0
tmux send-keys -t fscan:0.0 "echo d-nmap" Enter
tmux send-keys -t fscan:0.1 "echo d-nikto" Enter
tmux attach-session -t fscan
