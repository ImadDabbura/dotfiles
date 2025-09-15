# ---------- Colors ----------
autoload -U colors && colors
export CLICOLOR=1
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"

# ---------- Editor ----------
if command -v nvim >/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
else
  export EDITOR=vim
  export VISUAL=vim
fi

# ---------- Homebrew ----------
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# ---------- Vim/Neovim paths ----------
export VIMCONFIG="$HOME/.vim"
export VIMDATA="$HOME/.vim"
export NVIMCONFIG="$HOME/.config/nvim"
export NVIMDATA="$HOME/.local/share/nvim"

# ---------- Pager / man (nicer defaults) ----------
export LESS='-R --use-color -M -g -i -J -w --mouse'
export LESSHISTFILE=-
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

command -v fzf >/dev/null && export FZF_DEFAULT_COMMAND='fd --hidden --follow --strip-cwd-prefix --exclude .git'
command -v fzf >/dev/null && export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
command -v fzf >/dev/null && export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :200 {}'"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v atuin  >/dev/null && eval "$(atuin init zsh)"

# ---------- direnv (auto-load per-project envs) ----------
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
