export PATH=$PATH:~/bin
blocks

alias nv='nvim'
alias lz='lazygit'
alias ls='eza --icons'
alias tp='./tmux.sh'
alias py='python3'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="/home/fabbu/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
