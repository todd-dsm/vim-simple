# vim-simple

This is pretty much a "sensible defaults" build that supports Bash auto-completions. I just don't like writing GNU Bash scripts in an IDE; I wasn't raised that way.

## The PRE-TAHOE Edition

The macOS Terminal only supported 256 colors before Tahoe; it's what we had.

```shell
% grep -nA3 'COLOR SCHEME' vimrc
138:" COLOR SCHEME: Tahoe supports 24-bit color; previous versions only 256 colors.
139-" This is the only difference between the pre-Tahoe and main branches.
140-"==============================================================================
141-" Color the visual guide
```

## Quick Start

```shell
git clone git@github.com:todd-dsm/vim-simple.git code/ && cd code/vim-simple/
```

```shell
ln -s vimrc ~/.vimrc
ln -s vim ~/.vim
```

This should explain the broad strokes:

```shell
% tree -d -L1  ~/.vim-plugged
~/.vim-plugged
├── ale
├── L9
├── tlib_vim
├── vim-addon-mw-utils
├── vim-autocomplpop
├── vim-commentary
├── vim-fugitive
├── vim-sensible
├── vim-snipmate
├── vim-snippets
├── vim-solarized8
└── vim-surround
```
