unset trims

remove_alias () {
  alias $1 2>/dev/null 1>&2;
  if [ "$?" -eq 0 ]; then
    unalias $1
  fi
}

remove_alias ls;
remove_alias mv;
remove_alias cp;
remove_alias rm;
remove_alias mkdir;

unset remove_alias;
