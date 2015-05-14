if [[ -z $MY_BASHRC_RAN ]]; then
    export MY_BASHRC_RAN="yes"

    [[ -e /etc/bashrc ]] && source /etc/bashrc

    export GROOVY_HOME=/Applications/groovy-1.8.6
    export PATH=$PATH:$GROOVY_HOME/bin
    export GRAILS_HOME=/Applications/grails-2.1.0/
    export PATH=$PATH:$GRAILS_HOME/bin
    export GLASSFISH_HOME=/usr/local/Cellar/glassfish/3.1.2
    export PATH=$PATH:$GLASSFISH_HOME/bin
    export HISTSIZE=5000
    export HISTFILESIZE=5000
    export EDITOR=vim
    export VISUAL=vim

    # after paths are right, run id to set PS_COLOR correctly
    if [ `id -u` -eq 0 ]; then
      PS_COLOR="1;31m"
    else
      PS_COLOR="0;31m"
    fi

    GIT_STATUS=`which git >/dev/null 2>&1 || echo "nogit"`
    if [ "${GIT_STATUS}x" == "x" ]; then
        GIT_COMP=${HOME}/.dotfiles.git/git-completion.bash
        [[ -f ${GIT_COMP} ]] && source ${GIT_COMP}
    fi
    function __gitdir () 
    { 
        if [ -z "${1-}" ]; then
            if [ -n "${__git_dir-}" ]; then
                echo "$__git_dir";
            else
                if [ -d .git ]; then
                    echo .git;
                else
                    git rev-parse --git-dir 2> /dev/null;
                fi;
            fi;
        else
            if [ -d "$1/.git" ]; then
                echo "$1/.git";
            else
                echo "$1";
            fi;
        fi
    }

    __git_ps1 () 
    { 
        local g="$(__gitdir)";
        if [ -n "$g" ]; then
            local r="";
            local b="";
            if [ -f "$g/rebase-merge/interactive" ]; then
                r="|REBASE-i";
                b="$(cat "$g/rebase-merge/head-name")";
            else
                if [ -d "$g/rebase-merge" ]; then
                    r="|REBASE-m";
                    b="$(cat "$g/rebase-merge/head-name")";
                else
                    if [ -d "$g/rebase-apply" ]; then
                        if [ -f "$g/rebase-apply/rebasing" ]; then
                            r="|REBASE";
                        else
                            if [ -f "$g/rebase-apply/applying" ]; then
                                r="|AM";
                            else
                                r="|AM/REBASE";
                            fi;
                        fi;
                    else
                        if [ -f "$g/MERGE_HEAD" ]; then
                            r="|MERGING";
                        else
                            if [ -f "$g/BISECT_LOG" ]; then
                                r="|BISECTING";
                            fi;
                        fi;
                    fi;
                    b="$(git symbolic-ref HEAD 2>/dev/null)" || { 
                        b="$(
            case "${GIT_PS1_DESCRIBE_STYLE-}" in
            (contains)
              git describe --contains HEAD ;;
            (branch)
              git describe --contains --all HEAD ;;
            (describe)
              git describe HEAD ;;
            (* | default)
              git describe --exact-match HEAD ;;
            esac 2>/dev/null)" || b="$(cut -c1-7 "$g/HEAD" 2>/dev/null)..." || b="unknown";
                        b="($b)"
                    };
                fi;
            fi;
            local w="";
            local i="";
            local s="";
            local u="";
            local c="";
            local p="";
            if [ "true" = "$(git rev-parse --is-inside-git-dir 2>/dev/null)" ]; then
                if [ "true" = "$(git rev-parse --is-bare-repository 2>/dev/null)" ]; then
                    c="BARE:";
                else
                    b="GIT_DIR!";
                fi;
            else
                if [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
                    if [ -n "${GIT_PS1_SHOWDIRTYSTATE-}" ]; then
                        if [ "$(git config --bool bash.showDirtyState)" != "false" ]; then
                            git diff --no-ext-diff --quiet --exit-code || w="*";
                            if git rev-parse --quiet --verify HEAD > /dev/null; then
                                git diff-index --cached --quiet HEAD -- || i="+";
                            else
                                i="#";
                            fi;
                        fi;
                    fi;
                    if [ -n "${GIT_PS1_SHOWSTASHSTATE-}" ]; then
                        git rev-parse --verify refs/stash > /dev/null 2>&1 && s="$";
                    fi;
                    if [ -n "${GIT_PS1_SHOWUNTRACKEDFILES-}" ]; then
                        if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                            u="%";
                        fi;
                    fi;
                    if [ -n "${GIT_PS1_SHOWUPSTREAM-}" ]; then
                        __git_ps1_show_upstream;
                    fi;
                fi;
            fi;
            local f="$w$i$s$u";
            printf "${1:- (%s)}" "$c${b##refs/heads/}${f:+ $f}$r$p";
        fi
    }
    export PS1='[\[\033[$PS_COLOR\]\u@\h\[\033[0m\] \W$(__git_ps1 " (\[\033[1;33m\]%s\[\033[0m\])")]\$ '
    export LANG=en_US.UTF-8
fi
