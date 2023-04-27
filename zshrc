# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# Use oh-my-posh
if [[ "$OSTYPE" == "darwin"* ]]; then
    themepath="$(brew --prefix oh-my-posh)/themes"
else
    themepath="$HOME/.poshthemes"
fi
theme="$themepath/montys.omp.json"
eval "$(oh-my-posh init zsh --config $theme)"

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

# Pastebin alternative from the CLI 🤯
function paste() {
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
}

alias pfetch='PF_INFO="ascii title os host uptime pkgs memory editor wm de palette" pfetch'
pfetch

