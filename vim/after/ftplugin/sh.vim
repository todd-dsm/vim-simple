" Bash ftplugin
" Location: ~/.vim/after/ftplugin/sh.vim
" Purpose: Bash-specific settings and mappings
" Author:  todd-dsm
" Date: 2025

" Only run this once per buffer
if exists("b:did_bash_ftplugin")
  finish
endif
let b:did_bash_ftplugin = 1

"==============================================================================
" BASH-SPECIFIC SETTINGS
"==============================================================================
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
setlocal textwidth=80
setlocal commentstring=#\ %s

"==============================================================================
" BASH-SPECIFIC PLUGIN SETTINGS
"==============================================================================
" Syntastic settings for Bash
let g:syntastic_sh_checkers = ['bash', 'shellcheck']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Git fugitive mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

"==============================================================================
" ALE (SYNTAX CHECKING) CONFIGURATION
"==============================================================================
let g:ale_linters = {'sh': ['bash', 'shellcheck']}
let g:ale_fixers = {'sh': ['shfmt']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
