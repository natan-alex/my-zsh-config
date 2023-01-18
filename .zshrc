# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# for powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f $HOME/.config/zsh/.p10k.zsh ]] || source $HOME/.config/zsh/.p10k.zsh

# source other config files
source $ZDOTDIR/zsh-env-variables
source $ZDOTDIR/zsh-general-configs
source $ZDOTDIR/zsh-options
source $ZDOTDIR/zsh-plugins
source $ZDOTDIR/zsh-aliases
source $ZDOTDIR/zsh-programming-related
source $ZDOTDIR/zsh-autoloads
source $ZDOTDIR/zsh-bindings
