# shlibs

Small but handy aliases and functions for sh-compatible shells.

## Warning

Currently, **shlibs** intends for personal use only. The content of shlibs may change without warning. Use it at your own risk.

## Why shlibs?

I usually write and test programs in a cloud IDE. Each time I spawn a new virtual host, I have to set some aliases and functions for the environment.
To reduce the burden of repeated setting, I wrote this script.

## Usage

Load *shlibs/load.sh* to enable it:

```
$ source path/to/shlibs/load.sh
```

Load *shlibs/unload.sh* to disable it:

```
$ source path/to/shlibs/unload.sh
```

## Declarations

### Shell Functions

* `trims`: use `perl(1)` to remove trailing spases in source

### Shell Aliases

* `ls --color=auto`
* `mv -i`
* `cp -i`
* `rm -i`
* `mkdir -p`

## Copyright

Apache 2.0
