_remove_function ()
{
    if type $1 2>/dev/null 1>&2;
    then
        unset -f $1;
    fi
}

_remove_function trims;
_remove_function psquery;
_remove_function try;

unset -f _remove_function;

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

unset RECOLOR

unset BLACK
unset RED
unset GREEN
unset YELLOW
unset BLUE
unset PURPLE
unset CYAN
unset WHITE

unset BBLACK
unset BRED
unset BGREEN
unset BYELLOW
unset BBLUE
unset BPURPLE
unset BCYAN
unset BWHITE

unset UBLACK
unset URED
unset UGREEN
unset UYELLOW
unset UBLUE
unset UPURPLE
unset UCYAN
unset UWHITE

unset IBLACK
unset IRED
unset IGREEN
unset IYELLOW
unset IBLUE
unset IPURPLE
unset ICYAN
unset IWHITE
