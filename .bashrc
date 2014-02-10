# colors are pretty
alias ls="ls -G"

# my standard location for code projects
alias projs="cd ~/projects"

# git's diff is way better than normal diff
alias diff="git diff --no-index"

# sometimes we have to use old things
export SVN_EDITOR=vim

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# virtualenvwraper (requires virtualenvwrapper which is essential for .py dev)
source virtualenvwrapper.sh
