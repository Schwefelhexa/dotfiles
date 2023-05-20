# General options
setopt beep extendedglob nomatch notify
unsetopt autocd
bindkey -v

# Starship prompt
eval "$(starship init zsh)"

function vim() {
  nvim "$@" || /usr/bin/vim "$@"
}

# Thanks, https://salferrarello.com/zsh-alias-with-fallback !
function ls() {
  exa --icons "$@" || /usr/bin/ls "$@"
}
function l() {
  exa --icons --header -l --git "$@" || /usr/bin/ls -lh "$@"
}
function la() {
  exa --icons --header -la --git "$@" || /usr/bin/ls -lah "$@"
}
function lf() {
  exa --icons --group-directories-first -l -h -H -m -u -U --git "$@" || /usr/bin/ls -lah "$@"
}
function lt() {
  exa --icons -T --git "$@" || /usr/bin/ls -lah "$@"
}

function cat() {
  bat "$@" || /usr/bin/cat "$@"
}

eval $(thefuck --alias)
eval "$(pyenv init -)"

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias shuf="gshuf"
fi

bindkey '^R' history-incremental-search-backward

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Pastebin alternative from the CLI 🤯
function paste() {
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
}

alias pfetch='PF_INFO="ascii title os host uptime pkgs memory editor wm de palette" pfetch'
pfetch

