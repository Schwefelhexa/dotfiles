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

alias vim="nvim"

alias ls="exa --icons"
alias  l="exa --icons --header -l --git"
alias la="exa --icons --header -la --git"
alias lt="exa --icons -T --git"

alias cat="bat"

eval $(thefuck --alias)

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias shuf="gshuf"
fi

bindkey '^R' history-incremental-search-backward

alias pfetch='PF_INFO="ascii title os uptime pkgs memory shell editor wm" pfetch'
pfetch

