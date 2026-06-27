# --- OPZIONI STORIA ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# --- AUTOCOMPLETAMENTO COLORATO E CASE-INSENSITIVE ---
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
setopt AUTO_CD

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# --- PROMPT COLORATO CON INFO GIT ---
autoload -Uz colors && colors
autoload -Uz vcs_info

setopt PROMPT_SUBST

# Configura vcs_info per controllare TUTTO (anche i file non tracciati)
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'

# Questo hook dice a Git di considerare i file nuovi (untracked) come modifiche "unstaged"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        hook_com[unstaged]+="%F{yellow}●%f"
    fi
}

# Formato finale del prompt a destra: (branchstatus)
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b%u%c)%f'
zstyle ':vcs_info:git:*' actionformats '%F{magenta}(%b|%a%u%c)%f'

# Aggiorna prima di ogni prompt
precmd() { vcs_info }

# Prompt principale (a sinistra)
PROMPT='%F{cyan}%n%f@%F{blue}%m%f:%F{yellow}%~%f %(?.%F{green}➜%f.%F{red}➜%f) '

# Prompt di Git (a destra)
RPROMPT='${vcs_info_msg_0_}'

# --- ALIAS E COLORI ---
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# I tuoi alias personalizzati
alias s=source
alias t=tmux
alias q=exit
alias n=vi
alias a=cdh
alias m=make
alias b=bash
alias c=clear
alias h=top
alias gt="gdb -tui"
alias k="t kill-server"
alias zc="n ~/.zshrc"
alias szc="source ~/.zshrc"
alias v="vim"
alias p="n -p"
alias nn="cd ~/.config/nvim/ && n init.lua"
alias la="ls -lah"
alias lh="ls -lh"
alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -target image/png -out >"
alias sc="cd ~/.local/bin/scripts;la"
alias pi="ssh pi@192.168.1.134"

# --- ENV PATH ---
export PATH="$HOME/.local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export PATH=/usr/bin:$PATH
