# Small but handy aliases and functions. For Personal use only.
# Use it at your own risk!
# Author: Michael Chen  License: Apache 2.0

_is_perl_installed ()
{
    if ! perl --version 2>/dev/null 1>&2;
    then
        echo false;
        return;
    fi

    echo true;
}

if ! _is_perl_installed > /dev/null;
then
    echo "Perl is not installed on your system" >&2;
    echo "trims is disabled" >&2;
else
    if ! trims 2>/dev/null 1>&2;
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

if ! psquery 2>/dev/null 1>&2;
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

alias ls='ls --color=auto -F';
alias mv='mv -i';
alias cp='cp -i';
alias rm='rm -i';
alias mkdir='mkdir -p';

unset _is_perl_installed;
