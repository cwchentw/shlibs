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
