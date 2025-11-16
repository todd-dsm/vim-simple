# vim-simple Enhancement Notes

This document tracks pending enhancements and improvements for vim-simple.

## macOS Tahoe Terminal.app True Color Support

### Background

- **Issue**: Terminal.app in pre-Tahoe macOS only supports 256 colors, causing Solarized background to render brown instead of proper teal-blue
- **Current workaround**: iTerm2 displays Solarized perfectly with true color support
- **Solution**: macOS Tahoe (released September 15, 2025) adds 24-bit true color support to Terminal.app

### Pre-Tahoe

True Solarized goodness doesn't appear to be possible with 256 colors; default vim colors:

```vim
"==============================================================================
" COLOR SCHEME: pre-Tahoe
"==============================================================================
" Color the visual guide
highlight colorcolumn ctermbg=237
```

### macOS Tahoe and After

Solarized is now supported with Tahoe's 24-bit true color support:

```vim
"==============================================================================
" COLOR SCHEME: Tahoe
"==============================================================================
" Color the visual guide
highlight colorcolumn ctermbg=237

" Enable true color support only in iTerm2
if $TERM_PROGRAM == 'iTerm.app' || ($TERM_PROGRAM == 'Apple_Terminal' && has('termguicolors'))
  set termguicolors
else
  set t_Co=256
endif

" Set dark background
set background=dark

" Enable Solarized8 colorscheme (only if installed)
silent! colorscheme solarized8

" Fix line number and sign column backgrounds
highlight clear LineNr
highlight clear SignColumn
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
```

### Verification Steps After Upgrade

1. Upgrade to macOS Tahoe via System Settings → Software Update
2. Apply vimrc update above
3. Open Vim in Terminal.app
4. Compare against target: `zissues/target-solarized.png`
5. Background should be proper Solarized teal-blue (not brown)
6. Should match iTerm2 rendering exactly

---

## Completed Enhancements

### vim-plug Migration

- **Completed**: October 6, 2025
- Migrated from Pathogen to vim-plug for automatic plugin management
- Plugins now auto-install on first Vim launch
- Added AutoComplPop (L9 + vim-autocomplpop) for variable completion

### Solarized8 Colorscheme

- **Completed**: October 6, 2025
- Replaced altercation/vim-colors-solarized with lifepillar/vim-solarized8
- Working perfectly in iTerm2 with true color support
- Terminal.app awaiting macOS Tahoe upgrade for full support

### Enhanced Status Line

- **Completed**: October 6, 2025
- Modernized status line with buffer number, git branch, ALE status
- Format: `[Buf: 1] yo.sh [unix, bash, utf-8] [Git(main)] [✓] [0x23] [Line: 0016/0016 | Col: 00] All`
- Shows real-time linting status from ALE

### Filetype Associations

- **Completed**: October 6, 2025
- `.sh` files → bash filetype
- `.zsh` files → zsh filetype
- Custom bash snippets in `vim/after/snippets/bash.snippets`

### ALE Configuration

- **Completed**: October 6, 2025
- Disabled inline virtual text (kept status line messages)
- Linters: bash, shellcheck
- Auto-format on save with shfmt
