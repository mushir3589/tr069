#!/bin/sh
if tmux has-session -t 'genieacs'; then
  echo "GenieACS is already running."
  echo "To stop it use: ./genieacs-stop.sh"
  echo "To attach to it use: tmux attach -t genieacs"
else
  tmux new-session -s 'genieacs' -d
  tmux send-keys './genieacs/bin/genieacs-cwmp' 'C-m'
  tmux split-window
  tmux send-keys './genieacs/bin/genieacs-nbi' 'C-m'
  tmux split-window
  tmux send-keys './genieacs/bin/genieacs-fs' 'C-m'
  tmux split-window
  tmux send-keys 'cd genieacs-gui' 'C-m'
  tmux send-keys 'rails server' 'C-m'
  tmux send-keys 'sudo wireshark' 'C-m'
  tmux select-layout tiled 2>/dev/null
  tmux rename-window 'GenieACS'

  echo "GenieACS has been started in tmux session 'geneiacs'"
  echo "To attach to session, use: tmux attach -t genieacs"
  echo "To switch between panes use Ctrl+B-ArrowKey"
  echo "To deattach, press Ctrl+B-D"
  echo "To stop GenieACS, use: ./genieacs-stop.sh"
fi


