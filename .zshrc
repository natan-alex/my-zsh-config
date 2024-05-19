# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



### Setup zinit plugin manager

# Set the directory where to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if ZINIT_HOME folder does not exist
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"



### Plugins
# https://github.com/romkatv/powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k 
# https://github.com/zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting 
# https://github.com/zsh-users/zsh-completions
zinit light zsh-users/zsh-completions 
# https://github.com/zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions 
# https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab 



### Completions
# Loading
autoload -Uz compinit && compinit

zinit cdreplay -q

# Styling
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ":completion:*" menu no
# set list-colors to enable filename colorizing
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
# disable sort when completing `git checkout`
zstyle ":completion:*:git-checkout:*" sort false
# try first to complete the current word exactly as its written, then try case-insensitive or other matches
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
# switch group using `<` and `>`
zstyle ":fzf-tab:*" switch-group "<" ">"
# preview directory"s content when completing cd
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
# set descriptions format to enable group support. fzf-tab will ignore escape sequences here
zstyle ":completion:*:descriptions" format "[%d]"



### Environment variables
export EDITOR="nvim"



### History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
HISTFILE=$HOME/.zsh_history



### Options - https://zsh.sourceforge.io/Doc/Release/Options.html#Description-of-Options
setopt always_to_end    # move cursor to the end of the word under the cursor on completions
setopt auto_param_slash # add trailing slash after directory completion
setopt complete_aliases # substitute alias by the command before executing
setopt nomatch          # show error if there are no matches when globbing
setopt menucomplete     # cycle completion possibilities instead of opening the menu
unsetopt beep           # disable beeping
unsetopt flow_control   # prevent freeze on ctrl+s

# History related
# make sessions append their history list to the history file, rather than replacing it
setopt appendhistory
# import new commands from the history file, and also causes commands to be appended to the history file
setopt sharehistory
# when looking at history, do not display duplicates of a line previously found, even if the duplicates are not contiguous. 
setopt hist_find_no_dups
# remove old command if a new command being added to the history list duplicates it
setopt hist_ignore_all_dups
# do not enter command lines into the history list if they are duplicates of the previous event
setopt hist_ignore_dups
# remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space
setopt hist_ignore_space
# when writing out the history file, older commands that duplicate newer ones are omitted
setopt hist_save_no_dups



### Aliases
alias cl="clear"
alias cls="clear"
alias ..="cd .."
alias rm="rm -I"
alias ls="ls --color=auto"
alias la="ls --color=auto -A"



### Shell integrations
eval "$(fzf --zsh)"



### Keybindings
bindkey -v # vim like keybindings
bindkey "^l" autosuggest-accept
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^r" history-incremental-search-backward
bindkey "^[[P" delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" delete-word
bindkey "^H" backward-delete-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line



### Path and programming related
# dotnet 
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_ROOT=$HOME/apps/dotnet/
export PATH=$PATH:$DOTNET_ROOT

# rust
export PATH=$PATH:$HOME/.cargo/bin

# python
export PATH=$PATH:$HOME/.local/bin

# nvm
source /usr/share/nvm/init-nvm.sh

# flutter
export PATH=$PATH:$HOME/apps/flutter/bin
export CHROME_EXECUTABLE=chromium

# android
export ANDROID_SDK_ROOT=$HOME/apps/android
export ANDROID_AVD_HOME=$HOME/apps/android/avd
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# go
export PATH=$PATH:$HOME/go/bin

# custom binaries
export PATH=$PATH:$HOME/bin



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
