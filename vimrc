" Configuration file for vim
set modelines=0		" CVE-2007-2438
syntax on
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

execute pathogen#infect()
filetype plugin indent on

map <F3> :Autoformat <CR>
map <F7> :wincmd h <CR>
map <F8> :vsp <CR>
map <F9> :wincmd l <CR>
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup



" vim-template
let g:email = "edit ~/.vimrc to change me"
let g:formatdef_harttle = '"astyle --style=attach --style=java --pad-oper"'
let g:formatters_c = ['harttle']
let g:templates_directory = ['~/.vim/templates']

set encoding=utf-8
set completeopt-=preview
set tabstop=4
set shiftwidth=4
set smarttab
set number
set cursorline

set expandtab
let delimitMate_expand_cr = 1
filetype indent plugin on
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"


" enhance movemoent
inoremap <C-o> <C-o>o
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>A

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_key_select_completion = '<C-l>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


colorscheme molokai
let g:molokai_original = 1

if has("clipboard")
	set clipboard=unnamed " copy to the system clipboard

	if has("unnamedplus") " X11 support
		set clipboard+=unnamedplus
	endif
endif

"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>
