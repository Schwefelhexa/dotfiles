# General options
setopt nobeep extendedglob nomatch notify
unsetopt autocd
bindkey -v

# Starship prompt
eval "$(starship init zsh)"

if command -v -- "xcp" > /dev/null 2>&1; then
	function cp() {
		xcp "$@"
	}
fi

if command -v -- "nvim" > /dev/null 2>&1; then
	function vim() {
		nvim "$@"
	}
fi

if command -v -- "eza" > /dev/null 2>&1; then
	alias ls="eza --icons"
	alias l="eza --icons --header -l --git"
	alias la="eza --icons --header -la --git"
	alias lf="eza --icons --group-directories-first -l -h -H -m -u -U --git"
	alias lt="eza --icons -T --git -L=2"
	alias ltt="eza --icons -T --git -L=3"
	alias lttt="eza --icons -T --git -L=4"
	alias "lt*"="eza --icons -T --git"
fi

if command -v -- "bat" > /dev/null 2>&1; then
	alias cat="bat"
fi

eval $(thefuck --alias)

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias shuf="gshuf"
fi

bindkey '^R' history-incremental-search-backward

# Pastebin alternative from the CLI 🤯
function paste() {
    local file=${1:-/dev/stdin}
    curl --data-binary @${file} https://paste.rs
}

# Auto-complete SSH hostnames
autoload -Uz compinit
compinit

if command -v -- "zoxide" > /dev/null 2>&1; then
	eval "$(zoxide init zsh)"
	alias c="z"
	alias cd="z"
else
	alias c="cd"
fi

alias pfetch='PF_INFO="ascii title os host uptime pkgs memory editor wm de palette" pfetch'
pfetch

# pnpm
export PNPM_HOME="/Users/albarn/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/albarn/.bun/_bun" ] && source "/Users/albarn/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
