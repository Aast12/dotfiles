# Word movement (Alt+Arrow)
bindkey "\e\e[D" backward-word # ⌥← (iterm)
bindkey "\e\e[C" forward-word  # ⌥→ (iterm)
bindkey "\e[1;3D" backward-word # ⌥← (kitty/ghostty)
bindkey "\e[1;3C" forward-word  # ⌥→ (kitty/ghostty)

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Output format for `time`
if [[ `uname` == Darwin ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# Enable colored ls output
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Aliases
alias 11++='g++ -std=c++11'
alias em='/opt/homebrew/bin/emacsclient -c -a emacs'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias ls='ls -G'
alias cd=z

# Init calls (if they are available on both machines)
command -v starship >/dev/null && eval "$(starship init zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v atuin >/dev/null && eval "$(atuin init zsh)"

# fzf integration (if exists locally)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
