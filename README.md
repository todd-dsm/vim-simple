# vim-simple

The same vim config I had before; this time done correctly.

This is pretty much a "sensible defaults" build that supports Bash with auto-completions. I just don't like writing GNU Bash scripts in an IDE; I wasn't raised that way.

This should explain the broad strokes:

```shell
% tree -d -L 3                       
.
└── vim
    ├── after
    │   ├── ftplugin
    │   └── snippets
    ├── autoload
    ├── bundle
    │   ├── ale
    │   ├── tlib_vim
    │   ├── vim-addon-mw-utils
    │   ├── vim-commentary
    │   ├── vim-fugitive
    │   ├── vim-sensible
    │   ├── vim-snipmate
    │   ├── vim-snippets
    │   └── vim-surround
    ├── colors
    ├── doc
    └── snippets
```
