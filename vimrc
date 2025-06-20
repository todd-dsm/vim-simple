" vimSimple - Correctly
" Author: todd-dsm

"==============================================================================
" PLUGIN MANAGEMENT
"==============================================================================
" Initialize Pathogen first, before everything else
execute pathogen#infect()
execute pathogen#helptags()

"==============================================================================
" BASIC SETTINGS
"==============================================================================
" Use Vim settings, not Vi
set nocompatible

" Set leader key (comma is easier to reach than backslash)
let mapleader = ","

" Enable filetype detection, plugins, and indentation
filetype plugin indent on

" Enable syntax highlighting
syntax on

"==============================================================================
" CORE EDITOR BEHAVIOR
"==============================================================================
" Line numbers and cursor position
set number
set ruler

" Search behavior
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation defaults (individual languages will override)
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Text width and wrapping
set textwidth=80
set wrap
set colorcolumn=80

" Show matching brackets
set showmatch

" Better backspace behavior
set backspace=indent,eol,start

" Keep command history
set history=50

" Show incomplete commands
set showcmd

"==============================================================================
" VISUAL SETTINGS
"==============================================================================
" Always show status line
set laststatus=2


"==============================================================================
" VISUAL SETTINGS
"==============================================================================
set laststatus=2
set statusline=%f\ %m%r%h%w[%{&ff}]%y[%p%%][%04l,%04v]

" Color the visual guide
highlight colorcolumn ctermbg=237

"==============================================================================
" COLOR SCHEME
"==============================================================================
" set t_Co=16
set background=dark
" let g:solarized_termtrans=1
" let g:solarized_termcolors=16
" colorscheme solarized"
" colorscheme desert

"==============================================================================
" USEFUL MAPPINGS
"==============================================================================
" Clear search highlighting
nnoremap <leader>. :nohlsearch<CR>

" Toggle line numbers
nnoremap <leader>N :set number!<CR>

" Show/hide invisible characters
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:·

" Paste mode toggle
set pastetoggle=<F2>

"==============================================================================
" FILE HANDLING
"==============================================================================
" No backup files
set nobackup
set nowritebackup
set noswapfile

" Auto-remove trailing whitespace on save
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
" GIT FUGITIVE MAPPINGS
"==============================================================================
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

"==============================================================================
" SNIPPET CONFIGURATION
"==============================================================================
" Initialize SnipMate dictionary
let g:snipMate = get(g:, 'snipMate', {})

" Enable snippet override (disables selection dialog)
let g:snipMate.override = 1

" Use modern parser version  
let g:snipMate.snippet_version = 1

" Optional: Custom scope aliases for related filetypes
let g:snipMate.scope_aliases = {}
" let g:snipMate.scope_aliases['sh'] = 'sh,bash,zsh'
let g:snipMate.scope_aliases['sh'] = 'bash'
