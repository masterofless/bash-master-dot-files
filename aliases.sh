alias gs='git status'
alias m=less
alias df='df -h'
alias du='du -h'
alias dir='ls --color=auto --format=vertical'
alias gco='git checkout'
alias gb='git branch'
alias gco='git checkout'
alias gnp='git --no-pager'
alias lola='git lola | head -30'
alias vdir='ls --color=auto --format=long'
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias ll='ls -l'
alias lt='ls -lt'
alias vi=vim
alias whence='type -a'                        # where, of a sort
alias be='bundle exec'
alias bec='bundle exec cucumber'

cl () {
   cd /local/$USER/$**
}
my () {
   cd ~/$**
}
cdr () {
    cd ~/repos/$**
}
named () {
   find . -name "*$**"
}
src() {
   find . -name "*$**" | grep -v target
}
rebase () {
    for i in $*;
    do
        git checkout $i;
        git rebase master;
    done
}
rb () {
    cb=`git branch | grep -E "^\*" | perl -pe 's/^\* //'`
    git ma
    git pull
    git checkout `echo \$cb`
    git rebase master
}
containing () {
    find . -type f -exec grep -l $* {} \;
}

