# shlibs

Tiny but handy aliases and functions for Bourne shell compatible shell.

## Warning

Currently, **shlibs** intends for personal use only. The content of shlibs may change without warning. Use it at your own risk.

## Why shlibs?

Instead of setting personal configuration files like *.bashrc* or *.zshrc* each time when approaching a new Unix or Unix-like system, it is easier to write common aliases and functions in an external shell script, sourcing it as needed. Therefore, we wrote **shlibs** as common utilities across Unix or Unix systems.

Though **shlibs** is for personal use only, we keep it as general as possible, from which removing personal and private data. Hence, you may apply **shlibs** in your own machine.

## System Requirements

* A Bourne shell compatible shell
* Standard POSIX tools
* Perl

We tested shlibs against several Unix or Unix-like systems:

* Ubuntu LTS 20.04
* Rocky Linux 8.5
* openSUSE Leap 15.3
* macOS Big Sur
* FreeBSD 13.0

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

* `download`: download something with either `wget(1)` or `curl(1)`
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

Copyright (c) 2019-2021 ByteBard. Licensed under Apache 2.0
