# vimSimple Setup - Complete Working Configuration

This is the complete, tested sequence of steps to set up a modern, plugin-based Bash development environment in Vim.

## Prerequisites
- macOS with Terminal
- No existing Vim configuration

## 1. Create Directory Structure

```bash
mkdir -p ~/.vim/{after/ftplugin,after/snippets,autoload,bundle,colors,doc}
```

## 2. Install Pathogen

```bash
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

## 3. Install Essential Plugins

```bash
cd ~/.vim/bundle

# Core functionality plugins
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-fugitive.git

# Modern syntax checking (replaces syntastic)
git clone https://github.com/dense-analysis/ale.git

# Snippet support
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
```

## 4. Create vimrc Configuration

```viml
" vimSimple - Building it the Right Way
" Author: todd-dsm
" Date: 2025

"==============================================================================
" PLUGIN MANAGEMENT
"==============================================================================
execute pathogen#infect()
execute pathogen#helptags()

"==============================================================================
" BASIC SETTINGS
"==============================================================================
set nocompatible
let mapleader = ","
filetype plugin indent on
syntax on

"==============================================================================
" CORE EDITOR BEHAVIOR
"==============================================================================
set number
set ruler
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set textwidth=80
set wrap
set colorcolumn=80
set showmatch
set backspace=indent,eol,start
set history=50
set showcmd

"==============================================================================
" VISUAL SETTINGS
"==============================================================================
set laststatus=2
set statusline=%f\ %m%r%h%w[%{&ff}]%y[%p%%][%04l,%04v]

"==============================================================================
" USEFUL MAPPINGS
"==============================================================================
nnoremap <leader>. :nohlsearch<CR>
nnoremap <leader>N :set number!<CR>
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:·
set pastetoggle=<F2>

"==============================================================================
" FILE HANDLING
"==============================================================================
set nobackup
set nowritebackup
set noswapfile
autocmd BufWritePre * %s/\s\+$//e

"==============================================================================
" ALE (SYNTAX CHECKING) CONFIGURATION
"==============================================================================
let g:ale_linters = {'sh': ['bash', 'shellcheck']}
let g:ale_fixers = {'sh': ['shfmt']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1

"==============================================================================
" SNIPPET CONFIGURATION
"==============================================================================
let g:snipMate = get(g:, 'snipMate', {})
let g:snipMate.override = 1
let g:snipMate.snippet_version = 1
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['sh'] = 'bash'

"==============================================================================
" GIT FUGITIVE MAPPINGS
"==============================================================================
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
```

## 5. Create Bash-specific Configuration

```bash
cat > ~/.vim/after/ftplugin/sh.vim << 'EOF'
" Bash ftplugin - buffer-local settings only
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
setlocal textwidth=80
setlocal commentstring=#\ %s
EOF
```

## 6. Create Custom Bash Snippets (Modern [[ ]] syntax)

```bash
~/.vim/after/snippets/sh.snippets
# Modern Bash snippets with [[ ]] syntax
snippet if
	if [[ ${1:condition} ]]; then
		${0}
	fi
snippet elif
	elif [[ ${1:condition} ]]; then
		${0}
snippet for
	for ${1:i} in ${2:words}; do
		${0}
	done
snippet while
	while [[ ${1:condition} ]]; do
		${0}
	done
snippet case
	case ${1:word} in
		${2:pattern})
			${0}
			;;
	esac
```

## 7. Disable Conflicting Bundled Snippets
```bash
cd ~/.vim/bundle/vim-snippets/snippets/
mv bash.snippets bash.snippets.disabled
mv sh.snippets sh.snippets.disabled
mv zsh.snippets zsh.snippets.disabled
```

## Features Enabled

### Plugin-based functionality

- **vim-sensible**: Sensible defaults
- **vim-commentary**: `gcc` to comment/uncomment lines  
- **vim-surround**: Surround text with quotes, brackets, etc.
- **vim-fugitive**: Git integration (`,gs`, `,gd`, `,gb`)
- **ALE**: Asynchronous syntax checking with bash and shellcheck

### Custom key mappings:

- `,N` - toggle line numbers
- `,l` - toggle invisible characters  
- `,.` - clear search highlighting
- `F2` - toggle paste mode

### Bash snippets with modern syntax:

- `if<Tab>` - if statement with `[[ ]]`
- `for<Tab>` - for loop
- `while<Tab>` - while loop
- `case<Tab>` - case statement

### Automatic features:

- Syntax highlighting
- Auto-trim trailing whitespace on save
- 80-character line width with visual guide
- Automatic syntax checking on save

## Testing the Setup

```bash
vim /tmp/test.sh

# Test snippet expansion: type 'if' and press Tab
# Test commenting: press 'gcc' on a line
# Test git (if in a git repo): press ',gs'
```

This configuration provides a modern, maintainable Bash development environment in Vim using established, well-maintained plugins.

And the guiding light for us all: [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)