# Small but handy aliases and functions. For Personal use only.
# Use it at your own risk!
# Author: Michael Chen  License: Apache 2.0


perl --version > /dev/null;
if [ "$?" -ne 0 ]; then
  echo "Perl is not installed on your system" >&2;
  exit 1;
fi

type trims 2>/dev/null 1>&2;
if [ "$?" -ne 0 ]; then
  trims () {
    perl -lpi -e "s{\s+$}{}g;" $@;
  }
else
  echo "trims is set on your system" >&2;
fi

type psquery 2>/dev/null 1>&2;
if [ "$?" -ne 0 ]; then
  psquery () {
    ps aux | grep $1 | grep -v grep | tr -s ' ' | cut -d' ' -f2;
  }
else
  echo "psquery is set on your system" >&2;
fi
alias ls='ls --color=auto';
alias mv='mv -i';
alias cp='cp -i';
alias rm='rm -i';
alias mkdir='mkdir -p';
