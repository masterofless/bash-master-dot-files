# Theme
#omf install agnoster

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
set CDPATH . ~ ~/Projects

set PATH ~/bin $PATH
set PATH $PATH /usr/local/sbin

#eval (direnv hook fish)

set -x LESS '-r' # send raw control chars through so I see color
set -x PAGER most

# enable homebrew to search github
#set -x HOMEBREW_GITHUB_API_TOKEN 5694c403cf331b9625d1441c3778a2d73884d22c

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
alias m most
alias vdir "ls --color=auto --format=long"
alias vi nvim
alias whence "type -a"
alias kc kubectl
alias kcp 'kubectl --namespace prod'
alias kct 'kubectl --namespace test'
alias kcd 'kubectl --namespace dev'
alias kcccc 'kubectl config current-context'
alias rebrew 'brew update; and brew outdated; and brew upgrade; and brew cleanup -s; and brew cask cleanup; and brew prune'
alias savebrew 'bash -c \'(echo "brew list:"; brew list; echo; echo "brew cask list:"; brew cask list) > ~/Dropbox/BrewInstalledList\''

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

