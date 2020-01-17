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

unset BOLD_BLACK
unset BOLD_RED
unset BOLD_GREEN
unset BOLD_YELLOW
unset BOLD_BLUE
unset BOLD_PURPLE
unset BOLD_CYAN
unset BOLD_WHITE

unset BRIGHT_BLACK
unset BRIGHT_RED
unset BRIGHT_GREEN
unset BRIGHT_YELLOW
unset BRIGHT_BLUE
unset BRIGHT_PURPLE
unset BRIGHT_CYAN
unset BRIGHT_WHITE

unset BOLD_BRIGHT_BLACK
unset BOLD_BRIGHT_RED
unset BOLD_BRIGHT_GREEN
unset BOLD_BRIGHT_YELLOW
unset BOLD_BRIGHT_BLUE
unset BOLD_BRIGHT_PURPLE
unset BOLD_BRIGHT_CYAN
unset BOLD_BRIGHT_WHITE

unset UNDERLINE_BLACK
unset UNDERLINE_RED
unset UNDERLINE_GREEN
unset UNDERLINE_YELLOW
unset UNDERLINE_BLUE
unset UNDERLINE_PURPLE
unset UNDERLINE_CYAN
unset UNDERLINE_WHITE
