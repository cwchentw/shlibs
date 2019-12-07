# shlibs

Small but handy aliases and functions for sh-compatible shells.

## Warning

Currently, **shlibs** intends for personal use only. The content of shlibs may change without warning. Use it at your own risk.

## Why shlibs?

I usually write and test programs in a cloud IDE. Each time I spawn a new virtual host, I have to set some aliases and functions for the environment.
To reduce the burden of repeated setting, I wrote shlibs.

## System Requirements

* A sh-compatible shell
* Standard POSIX tools
* Perl

We tested shlibs on several Unix or Unix-like systems, such as

* Ubuntu 18.04 LTS
* Amazon Linux, RHEL or CentOS compatible
* TrueOS, FreeBSD compatible
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

## Copyright

Apache 2.0
