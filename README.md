# vim-simple

The same vim config I had before; this time done correctly.

This is pretty much a "sensible defaults" build that supports Bash with auto-completions. I just don't like writing GNU Bash scripts in an IDE; I wasn't raised that way.

Clone to `~/code/` then softlink to the home directory:

```shell
ln -s code/vim-simple/vimrc ~/.vimrc
ln -s code/vim-simple/vim ~/.vim
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
