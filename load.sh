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
export BOLD_BLACK='\e[1;30m';
export BOLD_RED='\e[1;31m';
export BOLD_GREEN='\e[1;32m';
export BOLD_YELLOW='\e[1;33m';
export BOLD_BLUE='\e[1;34m';
export BOLD_PURPLE='\e[1;35m';
export BOLD_CYAN='\e[1;36m';
export BOLD_WHITE='\e[1;37m';

# Bright console text colors
export BRIGHT_BLACK='\e[0;90m';
export BRIGHT_RED='\e[0;91m';
export BRIGHT_GREEN='\e[0;92m';
export BRIGHT_YELLOW='\e[0;93m';
export BRIGHT_BLUE='\e[0;94m';
export BRIGHT_PURPLE='\e[0;95m';
export BRIGHT_CYAN='\e[0;96m';
export BRIGHT_WHITE='\e[0;97m';

# Bold bright console text colors
export BOLD_BRIGHT_BLACK='\e[1;90m';
export BOLD_BRIGHT_RED='\e[1;91m';
export BOLD_BRIGHT_GREEN='\e[1;92m';
export BOLD_BRIGHT_YELLOW='\e[1;93m';
export BOLD_BRIGHT_BLUE='\e[1;94m';
export BOLD_BRIGHT_PURPLE='\e[1;95m';
export BOLD_BRIGHT_CYAN='\e[1;96m';
export BOLD_BRIGHT_WHITE='\e[1;97m';

# Underline console text colors
export UNDERLINE_BLACK='\e[4;30m';
export UNDERLINE_RED='\e[4;31m';
export UNDERLINE_GREEN='\e[4;32m';
export UNDERLINE_YELLOW='\e[4;33m';
export UNDERLINE_BLUE='\e[4;34m';
export UNDERLINE_PURPLE='\e[4;35m';
export UNDERLINE_CYAN='\e[4;36m';
export UNDERLINE_WHITE='\e[4;37m';
