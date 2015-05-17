set CDPATH . ~ ~/Projects ~/Business ~/Pictures

set PATH ~/bin $PATH
set PATH $PATH ~/.autojump/bin
set PATH $HOME/Library/Haskell/bin $PATH

# Fish git prompt
# set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
# set __fish_git_prompt_showupstream 'yes'
# set __fish_git_prompt_color_branch yellow

# Status Chars
# set __fish_git_prompt_char_dirtystate '*'
# set __fish_git_prompt_char_stagedstate '>'
# set __fish_git_prompt_char_stashstate '?'
# set __fish_git_prompt_char_upstream_ahead '^'
# set __fish_git_prompt_char_upstream_behind '\/'
# 
# function fish_prompt
  # set last_status $status
# 
  # set_color $fish_color_cwd
  # printf '%s' (prompt_pwd)
  # set_color normal
# 
  # printf '%s ' (__fish_git_prompt)
# 
  # set_color normal
# end
# 
alias be "bundle exec"
alias bec "bundle exec cucumber"
alias df "df -h"
alias dir "ls --color=auto --format=vertical"
alias du "du -h"
alias gb "git branch"
alias gco "git checkout"
alias gs "git status"
alias l "ls -CF"
alias la "ls -A"
alias la 'ls -a'
alias ll "ls -l"
alias lola "git lola | head -30"
alias lt 'ls -lt'
alias lth 'ls -lt | head'
alias m less
alias vdir "ls --color=auto --format=long"
alias vi vim
alias whence "type -a"

function rebase
    for i in $argv;
        git checkout $i;
        git rebase master;
    end
end

function rb
    set cb (git branch | grep -E "^\*" | perl -pe 's/^\* //')
    git checkout master
    git pull
    git checkout (echo $cb)
    git rebase master
end

function named
    find . -name "*$argv*"
end

