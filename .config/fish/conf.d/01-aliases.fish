abbr --add vim "nvim -p"
abbr --add python "python3"
abbr --add pip "pip3"

# git
abbr --add gc 'git commit --verbose'
abbr --add gp 'git push'
abbr --add gpu 'git pull'
abbr --add gwip 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
abbr --add gunwip 'git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
abbr --add gco 'git checkout'

alias ls='lsd -lah'
