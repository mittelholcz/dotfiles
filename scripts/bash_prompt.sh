#! /bin/bash


# return the colorized text
# usage: colortext <color> <text>
function colortext() {
    local red='\[\e[0;31m\]'
    local lightred='\[\e[1;31m\]'
    local green='\[\e[0;32m\]'
    local lightgreen='\[\e[1;32m\]'
    local yellow='\[\e[0;33m\]'
    local lightyellow='\[\e[1;33m\]'
    local blue='\[\e[0;34m\]'
    local lightblue='\[\e[1;34m\]'
    local purple='\[\e[0;35m\]'
    local lightpurple='\[\e[1;35m\]'
    local cyan='\[\e[0;36m\]'
    local lightcyan='\[\e[1;36m\]'
    local white='\[\e[0;37m\]'
    local lightwhite='\[\e[1;37m\]'
    local nc='\[\e[m\]' # no color

	local col=''
    case $1 in
        "red") col=${red} ;;
        "lightred") col=${lightred} ;;
        "green") col=${green} ;;
        "lightgreen") col=${lightgreen} ;;
        "yellow") col=${yellow} ;;
        "lightyellow") col=${lightyellow} ;;
        "blue") col=${blue} ;;
        "lightblue") col=${lightblue} ;;
        "purple") col=${purple} ;;
        "lightpurple") col=${lightpurple} ;;
        "cyan") col=${cyan} ;;
        "lightcyan") col=${lightcyan} ;;
        "white") col=${white} ;;
        "lightwhite") col=${lightwhite} ;;
        *) echo "ERR: colortext -- no such color" ; exit 1 ; ;;
    esac
    echo -n "${col}$2${nc}"
}


# return true if user is remote or false if user is logged in locally 
function amiremote() {
    # get actual tty
    MYTTY=$(tty)
    MYTTY=$(echo ${MYTTY:5})

    # get user related infos from command `w`
    WTTYFROM=$(w -h ${USER} | sed -r 's/^\S+\s+(\S+)\s+(\S+).*/\1 \2/')

    # select relevant line from output of `w`
    UNI1=$(echo -n "$WTTYFROM" | egrep "$MYTTY")
    UNI2=$(echo -n "$WTTYFROM" | egrep ":[0-9]")
    if [ "$UNI1" ] ; then
        WTTYFROM=$UNI1
    elif [ "$UNI2" ] ; then
        WTTYFROM=$UNI2
    else
        WTTYFROM=$(echo "$WTTYFROM" | head -n1)
    fi

    # parse infos
    WTTY=$(echo $WTTYFROM | cut -f1 -d' ')
    WFROM=$(echo $WTTYFROM | cut -f2 -d' ')

    # decide (TODO: maybe a better solution to match against IP number)
    if echo $WFROM | egrep -q '^[:-]' ; then
        return 1;
    else
        return 0;
    fi
}


# show ranger/vim in prompt
function prefix() {
    local PREFIX=''
    if [ -n "$RANGER_LEVEL" ]; then
        PREFIX+='r'
    fi
    if [ -n "$VIM" ]; then
        PREFIX+='v'
    fi
    if [ -n "$PREFIX" ] ; then
        PREFIX=$(colortext lightpurple "[${PREFIX}] ")
    fi
    echo -n "${PREFIX}"
}


# show user@host in prompt if important (if user is root or remote)
function userhostdir() {
    local res=''
    if [ "$USER" = "root" ]; then
        res=$(colortext lightred '\u@\h')
    else
        if amiremote ; then
            res=$(colortext lightgreen '\u@\h')
        fi
    fi
    res+=":$(colortext lightblue '\w')"
    echo -n $res
}


function settitle() {
    echo -en "\[\e]0;\u@\h: \w\a\]"
}


# get current branch in git repo
function git_status() {
    # no git or not in repo: exit
	if [ -z $(which git) ] || ! git -C . rev-parse 2>/dev/null ; then
		echo ''
		exit 0
	fi

    res=''

    # get branch or commit hash
    local branch=$(git status --branch 2> /dev/null | head -n1 | sed -r 's/.*\s(\w+)$/\1/')
	if [ "${branch}" ] ; then
        local stat="$(git status --porcelain | grep -o '^..')"
        local col='green'
        if [ "${stat}" ] ; then
            if egrep -q '^.[AMD?]' <<<${stat} ; then
                col='red'
            else
                col='yellow'
            fi
        fi
        res=$(colortext ${col} ${branch})
        res=" (${res})"
	fi
    echo -n "${res}"
}

if [ -f '/usr/lib/git-core/git-sh-prompt' ] ; then
    source /usr/lib/git-core/git-sh-prompt
    # export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_SHOWSTASHSTATE='y'
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWUPSTREAM="auto"
    echo -ne "$(settitle)$(prefix)$(userhostdir)$(__git_ps1)\\$ "
else
    echo -ne "$(settitle)$(prefix)$(userhostdir)$(git_status)\\$ "
fi



