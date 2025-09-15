# ----- Fast prompt (keep near top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Optional: run neofetch only on login shells
if [[ -o login ]] && command -v neofetch >/dev/null; then neofetch; fi

# ----- Oh-My-Zsh + theme
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting  # keep last in list to avoid highlight glitches
  zsh-history-substring-search
)

source "$ZSH/oh-my-zsh.sh"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ----- Local includes
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.env.zsh ]] && source ~/.env.zsh

source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

# ----- GNU make first
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# ----- History & ergonomics (daily QoL)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=200000; SAVEHIST=200000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_DUPS HIST_FIND_NO_DUPS SHARE_HISTORY HIST_REDUCE_BLANKS EXTENDED_HISTORY
setopt AUTO_CD AUTO_PUSHD PUSHD_SILENT PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS
set -o pipefail

# ----- Yazi wrapper (fixed read)
y() {
  local tmp="$(mktemp -t yazi-cwd.XXXXXX)" cwd
  yazi "$@" --cwd-file="$tmp"
  if read -r cwd < "$tmp" && [[ -n $cwd && $cwd != "$PWD" ]]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

