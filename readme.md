# vim-simple

This is pretty much a "sensible defaults" build that supports Bash auto-completions. I just don't like writing GNU Bash scripts in an IDE; I wasn't raised that way.

If you haven't moved to Tahoe yet, then check out the `pre-tahoe` branch; the big difference is color support.

## Quick Start

```shell
git clone git@github.com:todd-dsm/vim-simple.git && cd vim-simple/
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
├── auto-pairs
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
