unset -f trims;
unset -f psquery;
unset -f try;

_remove_alias ()
{
    if (alias $1 2>/dev/null 1>&2);
    then
        unalias $1;
    fi
}

_remove_alias ls;
_remove_alias mv;
_remove_alias cp;
_remove_alias rm;
_remove_alias mkdir;

unset _remove_alias;
