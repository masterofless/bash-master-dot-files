#echo "this is bash_profile"
alias be='bundle exec'
alias bec='bundle exec cucumber'
alias df='df -h'
alias dir='ls --color=auto --format=vertical'
alias du='du -h'
alias gb='git branch'
alias gco='git checkout'
alias gco='git checkout'
alias gnp='git --no-pager'
alias gs='git status'
alias l='ls -CF'                              #
alias la='ls -A'                              # all but . and ..
alias ll='ls -l'
alias lola='git lola | head -30'
alias lt='ls -lt'
alias m=less
alias vdir='ls --color=auto --format=long'
alias vi=vim
alias whence='type -a'                        # where, of a sort

cdr () {
    cd ~/repos/$**
}
named () {
   find . -name "*$**"
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


# Hackish to gracefully handle systems without git
function __git_ps1 {
  echo ""
}

PS1='\[\e[1;32m\]\u\[\e[0m\]\[\e[1;36m\]@\h\[\e[0m\]\[\e[0m\]\[\e[0;37m\]/\W\[\e[0m\]$ '

if [[ -z $MY_BASH_PROFILE_RAN ]]; then
    #echo "running my bash profile"
    export MY_BASH_PROFILE_RAN="yes"

    export EDITOR=vim
    export VISUAL=vim
    export LESS="-iMR"
    export GREP_OPTIONS="--color=auto"
    export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:';

    export HISTSIZE=5000
    export HISTFILESIZE=5000
    export HISTFILE="${HOME}/.history/bash_history.`hostname`"
fi

#==> Caveats (from brew install rbenv ruby-build)
#To use Homebrew's directories rather than ~/.rbenv add to your profile:
  #export RBENV_ROOT=/usr/local/var/rbenv

  #To enable shims and autocompletion add to your profile:
    #if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"

source ${HOME}/.bashrc

