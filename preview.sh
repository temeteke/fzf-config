if type bat > /dev/null 2>&1; then
    export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {} 2>/dev/null || ls {}'"
fi

if type tree > /dev/null 2>&1; then
    export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
else
    export FZF_ALT_C_OPTS="--preview 'ls {}'"
fi
