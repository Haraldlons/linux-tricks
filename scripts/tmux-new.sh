#!/bin/sh
tmux new-session \; \
  send-keys 'cd ~/coding && clear' C-m \; \
  split-window -h \; \
  send-keys 'cd ~/coding && clear' C-m \; \
  split-window -v \; \
  send-keys 'cd ~/coding && clear' C-m \; \
  select-pane -t 0 \; \
  split-window -v \; \
  send-keys 'cd ~/coding/website-v4 && clear' C-m \; \
  split-window -h \; \
  send-keys 'cd ~/coding/website-v4 && clear' C-m \; \
  select-pane -t 4 \; \
  send-keys 'cd ~/coding/website-v4 && npm start && clear' C-m \; \

#  IDs of panes
# ------------
# | 0  |  1  |
# |----------|
# | 2  |  3  |
# ------------
