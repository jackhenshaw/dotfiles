# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/home/$USER/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
DEFAULT_USER="jack"

# Autocompletion configuration
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting )

# configure plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
export LANG=en_GB.UTF-8
# add bind keys to allow searching using arrow keys (after ctrl-r)
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Define aliases
source $ZSH/.zsh_alias

