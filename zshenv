# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0
export DOCKER_BUILDKIT=0
export GOPATH="$HOME/.go"
export RUSTC_WRAPPER=sccache
export PYENV_ROOT="$HOME/.pyenv"

export EDITOR="nvim"

export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.files/scripts"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$PYENV_ROOT/bin"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac specific

    export PATH="$PATH:/opt/homebrew/bin"
    export PATH="$PATH:/opt/homebrew/lib"
else
    # Linux specific

    export PATH="$PATH:$HOME/.spicetify"
    export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
fi

# Theming
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export BAT_THEME="Catppuccin-macchiato"

