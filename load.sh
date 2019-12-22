# Small but handy aliases and functions. For Personal use only.
# Use it at your own risk!
# Author: Michael Chen  License: Apache 2.0

_is_perl_installed ()
{
    if ! command -v perl 2>/dev/null 1>&2;
    then
        return 1;
    fi

    return 0;
}

# Check it later.
if ! _is_perl_installed > /dev/null;
then
    echo "Perl is not installed on your system" >&2;
    echo "trims is disabled" >&2;
else
    if ! type trims 2>/dev/null 1>&2;
    then
        trims ()
        {
            local file=$1;
            if [ -z "$file" ];
            then
                echo "No file" >&2;
                return 1;
            fi

            perl -lpi -e "s{\s+$}{}g;" $@;
        }
    else
        echo "trims is set on your system" >&2;
    fi
fi

# Check it later.
if ! type psquery 2>/dev/null 1>&2;
then
    psquery ()
    {
        local query=$1;

        if [ -z "$query" ];
        then
            echo "No query" >&2;
            return 1;
        fi

        ps aux | grep $query | grep -v grep | tr -s ' ' | cut -d' ' -f2;
    }
else
    echo "psquery is set on your system" >&2;
fi

# Check it later.
if ! type try 2>/dev/null 1>&2;
then
    try ()
    {
        if [ -z "$1" ];
        then
            return;
        fi

        local _try=$1;
        local _i=5;

        if echo "$_try" | grep -o -E "^[+-]?\d+$" >/dev/null;
        then
            _i=$_try;
            shift;
        fi

        if [ -z "$1" ];
        then
            return;
        fi

        if [ $_i -gt 0 ];
        then
            while [ $_i -gt 0 ];
            do
                $@ && return;
                sleep 10;
                _i=$(( $_i - 1));
            done
        else
            while true;
            do
                $@ && return;
                sleep 10;
            done
        fi
    }
else
    echo "try is set on your system" >&2;
fi

if [ $(uname) = "Linux" ] || [ $(uname) = "SunOS" ];
then
    alias ls='ls -F --color=auto';
else
    alias ls='ls -F -G';
fi

alias mv='mv -i';
alias cp='cp -i';
alias rm='rm -i';
alias mkdir='mkdir -p';

unset _is_perl_installed;

# Reset color
export RECOLOR='\e[0m';

# Regular console text colors
export BLACK='\e[0;30m';
export RED='\e[0;31m';
export GREEN='\e[0;32m';
export YELLOW='\e[0;33m';
export BLUE='\e[0;34m';
export PURPLE='\e[0;35m';
export CYAN='\e[0;36m';
export WHITE='\e[0;37m';

# Bold console text colors
export BBLACK='\e[1;30m';
export BRED='\e[1;31m';
export BGREEN='\e[1;32m';
export BYELLOW='\e[1;33m';
export BBLUE='\e[1;34m';
export BPURPLE='\e[1;35m';
export BCYAN='\e[1;36m';
export BWHITE='\e[1;37m';

# Underline console text colors
export UBLACK='\e[4;30m';
export URED='\e[4;31m';
export UGREEN='\e[4;32m';
export UYELLOW='\e[4;33m';
export UBLUE='\e[4;34m';
export UPURPLE='\e[4;35m';
export UCYAN='\e[4;36m';
export UWHITE='\e[4;37m';

# High intensity console text colors
export IBLACK='\e[0;90m';
export IRED='\e[0;91m';
export IGREEN='\e[0;92m';
export IYELLOW='\e[0;93m';
export IBLUE='\e[0;94m';
export IPURPLE='\e[0;95m';
export ICYAN='\e[0;96m';
export IWHITE='\e[0;97m';
