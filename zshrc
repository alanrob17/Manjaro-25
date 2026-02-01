# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Source aliases file if it exists
#if [ -f ~/.zsh-aliases ]; then
    source ~/.zsh_aliases
#fi

# Colour  man page output
export PAGER=most

# Add to $PATH
export PATH=$HOME/.local/bin:$PATH

source "$HOME/.cargo/env"
source ~/.local/bin/shell_funcs.sh

# Colour  man page output
export PAGER=most

plugins=(git)

eval "$(zoxide init zsh)"

source <(fzf --zsh)
