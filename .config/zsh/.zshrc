eval "$(starship init zsh)"

alias awsl="aws --endpoint=http://localhost:4566"
alias vim=nvim
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias ls="ls --color=auto"
alias python="python3"
alias pip="pip3"

source "$ZDOTDIR/sensat.sh"
