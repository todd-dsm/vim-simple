# Getting Started with vim-simple

A quick reference guide for using vim-simple and its plugins.

## Plugin Management (vim-plug)

### Basic Commands
```vim
:PlugInstall    " Install all plugins listed in vimrc
:PlugUpdate     " Update all installed plugins
:PlugClean      " Remove plugins no longer in vimrc
:PlugStatus     " Check status of installed plugins
:PlugUpgrade    " Upgrade vim-plug itself
```

**Documentation:** https://github.com/junegunn/vim-plug

---

## Syntax Checking & Linting (ALE)

### Commands
```vim
:ALEInfo        " Show ALE configuration and linter status
:ALEDetail      " Show detailed error message for current line
:ALEFix         " Manually run fixers (auto-runs on save)
:ALEToggle      " Enable/disable ALE
:ALELint        " Manually trigger linting
```

### Navigation
```vim
]a              " Jump to next error/warning
[a              " Jump to previous error/warning
```

**Status line shows:** `[✓]` for no errors, `[E:2 W:3]` for errors/warnings

**Documentation:** https://github.com/dense-analysis/ale

---

## Snippets (SnipMate)

### Usage
Type the snippet trigger and press `<Tab>` to expand:

```bash
if<Tab>         # Expands to if [[ condition ]]; then ... fi
for<Tab>        # Expands to for loop
while<Tab>      # Expands to while loop
case<Tab>       # Expands to case statement
elif<Tab>       # Expands to elif clause
```

After expansion, use `<Tab>` to jump between placeholders.

**Custom snippets location:** `vim/after/snippets/bash.snippets`

**Documentation:** https://github.com/garbas/vim-snipmate

---

## Auto-Completion (AutoComplPop)

### Behavior
- Automatically shows completion popup after typing 2+ characters
- Completes variables, keywords, and commands
- No manual trigger needed

### Manual Completion (if needed)
```vim
<Ctrl-N>        " Next completion
<Ctrl-P>        " Previous completion
<Ctrl-X><Ctrl-O> " Omni completion
```

**Documentation:** https://github.com/othree/vim-autocomplpop

---

## Git Integration (Fugitive)

### Custom Keybindings
```vim
,gs             " Git status
,gd             " Git diff
,gb             " Git blame
```

### Common Commands
```vim
:Git status     " Show git status
:Git commit     " Commit changes
:Git push       " Push to remote
:Git pull       " Pull from remote
:Git log        " Show commit log
:Gdiff          " Show diff in split window
:Gblame         " Show git blame
```

**Documentation:** https://github.com/tpope/vim-fugitive

---

## Custom Keybindings

**Leader key:** `,` (comma)

### Editor Controls
```vim
,N              " Toggle line numbers
,l              " Toggle invisible characters (tabs, EOL)
,.              " Clear search highlighting
F2              " Toggle paste mode
```

### Text Manipulation
```vim
gcc             " Toggle comment on current line (vim-commentary)
gc{motion}      " Comment out motion (e.g., gcap = comment paragraph)
cs"'            " Change surrounding " to ' (vim-surround)
ds"             " Delete surrounding "
ysiw"           " Add " around inner word
```

**Commentary:** https://github.com/tpope/vim-commentary
**Surround:** https://github.com/tpope/vim-surround

---

## File Navigation

### Basic Navigation
```vim
:e filename     " Edit file
:w              " Write (save) file
:q              " Quit
:wq             " Write and quit
:q!             " Quit without saving
```

### Buffer Management
```vim
:ls             " List all buffers
:b <number>     " Switch to buffer by number
:bn             " Next buffer
:bp             " Previous buffer
:bd             " Delete buffer
```

### Window Splits
```vim
:sp filename    " Horizontal split
:vsp filename   " Vertical split
<Ctrl-W>h/j/k/l " Navigate between splits
<Ctrl-W>=       " Equalize split sizes
<Ctrl-W>q       " Close current split
```

---

## Search & Replace

### Search
```vim
/pattern        " Search forward
?pattern        " Search backward
n               " Next match
N               " Previous match
*               " Search word under cursor
,.              " Clear search highlighting (custom binding)
```

### Replace
```vim
:%s/old/new/g   " Replace all in file
:%s/old/new/gc  " Replace all with confirmation
:s/old/new/g    " Replace all in current line
```

---

## Vim Settings

### Show Current Settings
```vim
:set            " Show all modified settings
:set all        " Show all settings
:set option?    " Check specific option value
```

### Common Settings
```vim
:set number     " Show line numbers
:set nonumber   " Hide line numbers
:set paste      " Enable paste mode
:set nopaste    " Disable paste mode
:colorscheme    " Show current colorscheme
```

---

## Bash-Specific Features

### Filetype Detection
- `.sh` files → automatically treated as bash
- `.zsh` files → automatically treated as zsh

### Linting
- **bash**: Basic bash syntax checking
- **shellcheck**: Advanced shell script analysis
- **shfmt**: Auto-formatting on save

### Auto-formatting
- Trailing whitespace automatically removed on save
- 80-character line width enforced
- Visual guide at column 80

---

## Status Line Information

Format: `[Buf: N] filename [format, type, encoding] [Git(branch)] [ALE] [hex] [Line: N/N | Col: N] %`

Example: `[Buf: 1] yo.sh [unix, bash, utf-8] [Git(main)] [✓] [0x20] [Line: 0007/0010 | Col: 05] 70%`

**Components:**
- `[Buf: 1]` - Buffer number
- `yo.sh` - Filename
- `[unix, bash, utf-8]` - File format, type, encoding
- `[Git(main)]` - Current git branch
- `[✓]` or `[E:N W:N]` - ALE status (errors/warnings)
- `[0x20]` - Hex value of character under cursor
- `[Line: 0007/0010 | Col: 05]` - Line and column position
- `70%` - Position in file

---

## Colorscheme (Solarized8)

### Current Setup
- **iTerm2:** Perfect rendering with true colors
- **Terminal.app:** Limited to 256 colors (awaiting macOS Tahoe for true color support)

### Switching Colorschemes
```vim
:colorscheme solarized8           " Default
:colorscheme solarized8_flat      " Flat variant
:colorscheme solarized8_high      " High contrast variant
:colorscheme solarized8_low       " Low contrast variant
```

**Documentation:** https://github.com/lifepillar/vim-solarized8

---

## Help System

### Getting Help
```vim
:help                    " General help
:help vim-plug           " Plugin-specific help
:help ale                " ALE help
:help snipmate           " SnipMate help
:help <topic>            " Help on specific topic
```

### Navigation in Help
```vim
<Ctrl-]>        " Jump to tag under cursor
<Ctrl-O>        " Jump back
:q              " Close help window
```

---

## Troubleshooting

### Plugin Issues
```vim
:PlugStatus     " Check if all plugins are installed
:PlugInstall!   " Force reinstall all plugins
:PlugClean!     " Force remove unused plugins
```

### ALE Not Working
```vim
:ALEInfo        " Check linter configuration
:echo executable('shellcheck')  " Check if shellcheck is installed
:echo executable('shfmt')       " Check if shfmt is installed
```

### Colorscheme Issues
```vim
:set termguicolors?    " Check if true colors enabled
:set t_Co?             " Check color mode (should be 256 or termguicolors)
:colorscheme           " Verify current colorscheme
```

### Reset to Defaults
```vim
:source ~/.vimrc       " Reload configuration
```

---

## Learning Resources

### Vim Fundamentals
- **Learn Vimscript the Hard Way:** https://learnvimscriptthehardway.stevelosh.com/
- **Vim Documentation:** `:help user-manual`
- **Interactive Tutorial:** Run `vimtutor` in terminal

### Plugin Documentation
- **vim-plug:** https://github.com/junegunn/vim-plug
- **ALE:** https://github.com/dense-analysis/ale
- **vim-fugitive:** https://github.com/tpope/vim-fugitive
- **vim-surround:** https://github.com/tpope/vim-surround
- **vim-commentary:** https://github.com/tpope/vim-commentary
- **SnipMate:** https://github.com/garbas/vim-snipmate
- **Solarized8:** https://github.com/lifepillar/vim-solarized8

---

## Quick Start Checklist

After installation:

- [ ] Verify plugins installed: `:PlugStatus`
- [ ] Test snippet: Type `if<Tab>` in a .sh file
- [ ] Test auto-completion: Type a variable name
- [ ] Check linting: Open a .sh file with errors
- [ ] Test git integration: `,gs` in a git repo
- [ ] Verify colorscheme: Check background color matches Solarized
- [ ] Review status line: Check all components display correctly

For installation instructions, see `docs/config-notes.md`
