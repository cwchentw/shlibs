# Small but handy aliases and functions. For Personal use only.
# Use it at your own risk!
# Author: Michael Chen  License: Apache 2.0

_is_perl_installed () {
  perl --version 2>/dev/null 1>&2;
  if [ "$?" -ne 0 ]; then
    echo 1;
    return;
  fi

  echo 0;
}

if [ $(_is_perl_installed) != 0 ]; then
  echo "Perl is not installed on your system" >&2;
  echo "trims is disabled" >&2;
else
  type trims 2>/dev/null 1>&2;
  if [ $? != 0 ]; then
    trims () {
      perl -lpi -e "s{\s+$}{}g;" $@;
    }
  else
    echo "trims is set on your system" >&2;
  fi
fi

type psquery 2>/dev/null 1>&2;
if [ "$?" -ne 0 ]; then
  psquery () {
    ps aux | grep $1 | grep -v grep | tr -s ' ' | cut -d' ' -f2;
  }
else
  echo "psquery is set on your system" >&2;
fi

type now 2>/dev/null 1>&2;
if [ "$?" -ne 0 ]; then
  now () {
    date +"%Y/%m/%d %I:%M %p %z"
  }
else
  echo "now is set on your system" >&2;
fi

alias ls='ls --color=auto -F';
alias mv='mv -i';
alias cp='cp -i';
alias rm='rm -i';
alias mkdir='mkdir -p';

unset _is_perl_installed;
