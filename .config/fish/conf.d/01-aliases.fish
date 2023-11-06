alias vim="nvim -p"
alias ls="ls -G"
alias python="python3"
alias pip="pip3"

# git
alias gc='git commit --verbose'
alias gp='git push'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
