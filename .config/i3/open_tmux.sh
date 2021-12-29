if command -v tmux &> /dev/null && [ -n "$PS1" ]; then
    exec konsole -e tmux
else
    exec konsole
fi
