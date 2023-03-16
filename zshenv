
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0
export DOCKER_BUILDKIT=0
export GOPATH="$HOME/.go"
export RUSTC_WRAPPER=sccache

export EDITOR="nvim"

export PATH="$PATH:$HOME/.cargo/env"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.files/scripts"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$GOPATH/bin"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac specific

    export PATH="$PATH:/opt/homebrew/bin"
else
    # Linux specific

    export PATH="$PATH:$HOME/.spicetify"
    export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
fi

