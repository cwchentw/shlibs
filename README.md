# shlibs

Tiny but handy aliases and functions for `sh`-compatible shell.

## Warning

Currently, **shlibs** intends for personal use only. The content of shlibs may change without warning. Use it at your own risk.

## Why shlibs?

Instead of setting personal configuration files like *.bashrc* or *.zshrc* each time when approaching a new Unix or Unix-like system, it is easier to write common aliases and functions in an external shell script, sourcing it as needed. Therefore, we wrote **shlibs** as common utilities across Unix or Unix systems.

Though **shlibs** is for personal use only, we keep it as general as possible, from which removing personal and private data. Hence, you may apply **shlibs** in your own machine.

## System Requirements

* A `sh`-compatible shell
* Standard POSIX tools
* Perl

We tested shlibs against several Unix or Unix-like systems:

* Ubuntu 18.04 LTS
* CentOS 8
* openSUSE Leap 15.1
* TrueOS, which is FreeBSD compatible
* Solaris 11

It should work on other Unix or Unix-like systems as well.

## Usage

Load *shlibs/load.sh* to enable it:

```
$ . path/to/shlibs/load.sh
```

Load *shlibs/unload.sh* to disable it:

```
$ . path/to/shlibs/unload.sh
```

## Shell Functions in shlibs

* `psquery`: query PID by text
* `trims`: use `perl(1)` to remove trailing spases in source
* `try`: try specific command multiple times

### `try`

`repeat` is a reserved word in Bash. Therefore, we name our function `try`.

By default, `try` try specific command for 5 times:

```
$ try wget -c https://example.com/path/to/software-0.1.tar.gz
```

You may try your command more or less times:

```
$ try 3 wget -c https://example.com/path/to/software-0.1.tar.gz
```

You may try your command until it succeeds with `0` or `-1` times:

```
$ try -1 wget -c https://example.com/path/to/software-0.1.tar.gz
```

## Shell Aliases in shlibs

* `ls -F --color=auto`
* `mv -i`
* `cp -i`
* `rm -i`
* `mkdir -p`

## Variables

* Common console colors

## Copyright

Apache 2.0
