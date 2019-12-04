# Theme
#omf install agnoster

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
set CDPATH . ~ ~/Avalon ~/Projects

set PATH ~/bin $PATH
set PATH $PATH /usr/local/sbin
set PATH $PATH ~/Applications/google-cloud-sdk/bin/
set PATH $PATH /usr/local/opt/gettext/bin
set PATH $PATH (go env GOPATH)/bin

set -x LESS '-r' # send raw control chars through so I see color
# b/c for some reason this is the only one that shows me line 1 of files on this machine
set -x PAGER most
set -x VISUAL nvim
set -x EDITOR nvim
eval (direnv hook fish)

# set up awscli completion
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# enable homebrew to search github
#set -x HOMEBREW_GITHUB_API_TOKEN 5694c403cf331b9625d1441c3778a2d73884d22c

alias df "df -h"
alias du "du -h"
alias gb "git branch"
alias gco "git checkout"
alias gs "git status"
alias lola "git lola | head -30"
alias gbr "git --no-pager branch"
alias l "ls -CF"
alias la "ls -A"
alias la 'ls -a'
alias ll "ls -l"
alias lt 'ls -lt'
alias lth 'ls -lt | head'
alias dir "ls --color=auto --format=vertical"
alias m most
alias vdir "ls --color=auto --format=long"
alias vi nvim
alias whence "type -a"
alias kc kubectl
#alias kcp 'kubectl --namespace prod'
alias kct 'kubectl --namespace test'
alias kcd 'kubectl --namespace dev'
alias kca 'kubectl --namespace afc'
alias kcccc 'kubectl config current-context'
alias rebrew 'brew update; and brew outdated; and brew upgrade; and brew cleanup -s; and brew cask cleanup; and brew prune'
alias savebrew 'bash -c \'(echo "brew list:"; brew list; echo; echo "brew cask list:"; brew cask list) > ~/Dropbox/BrewInstalledListAvalon\''
alias gbs 'gcloud builds submit'
alias gbl 'gcloud builds list'

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

function knuke
    for p in (kcd get pods | grep "$argv" | perl -pe 's/ .*//'); kcd delete pod $p; end
end

function fish_right_prompt
  if test -n "$K8S_DIR"
    set color FF0
    kubectl config current-context
    if test -n "$GCP_PROJECT_ID"
      echo " | "
      gcloud config --format json list core/project | jq -r .core.project
    end
    set color normal
  else
    echo ""
  end
end
