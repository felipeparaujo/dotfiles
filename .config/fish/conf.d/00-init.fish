set -U fish_greeting
eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source
set -gx PATH "$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

