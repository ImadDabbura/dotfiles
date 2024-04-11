# System info
if command -v neofetch > /dev/null; then
    eval "neofetch"
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
    fzf-tab
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=blue,bold,underline"

source $ZSH/oh-my-zsh.sh

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.env ]]; then
    source ~/.env
fi

# FZF tab
autoload -U compinit; compinit
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Prefer GNU `make` over the default `make`
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Use `bat` as previewer for manpages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# FZF
# [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window up:3:hidden:wrap\
  --bind 'ctrl-/:toggle-preview'\
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'\
  --color header:italic\
  --header 'Press CTRL-Y to copy command into clipboard'"

# Conda
eval "$(~/miniforge3/bin/conda shell.zsh hook)"

# Autojump
source /opt/homebrew/opt/autojump/share/autojump/autojump.zsh
