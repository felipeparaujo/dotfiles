set -U fish_greeting
set -gx PATH "$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source
zoxide init fish --cmd cd | source

