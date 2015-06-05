[ -n "$TMUX" ] && tmux-renumber-sessions

precmd() { [ -n "$TMUX" ] && tmux rename-window "$(basename $PWD)" }
