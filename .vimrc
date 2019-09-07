" Syntax highlight
"filetype plugin on
:syntax on

set encoding=utf-8

set number

autocmd Filetype go setlocal tabstop=4
autocmd Filetype go setlocal shiftwidth=4

autocmd Filetype html setlocal tabstop=4
autocmd Filetype html setlocal shiftwidth=4

autocmd Filetype json setlocal tabstop=4
autocmd Filetype json setlocal shiftwidth=4

autocmd Filetype yaml setlocal tabstop=2
autocmd Filetype yaml setlocal shiftwidth=2

autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2


set showcmd
set ruler
set spell

set nowrap

set splitbelow
set splitright

set foldmethod=indent

"gvim
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Noto\ Mono\ for\ Powerline\ Regular\ 12
set guicursor=a:hor20-Cursor

"shortcuts
inoremap jj <ESC>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'yggdroot/indentline'
"Plugin 'scrooloose/syntastic'
"Plugin 'sjl/gundo.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
"Plugin 'klen/python-mode'
Plugin 'w0rp/ale'
" Plugin 'tmhedberg/simpylfold'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'chiel92/vim-autoformat'
Plugin 'junegunn/fzf.vim'
"Plugin 'tpope/vim-obsession'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Indentline
let g:indentLine_enabled = 1
"let g:indentLine_setColors = 0
" undo conceal level set up
let g:indentLine_conceallevel = 0

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_rust_src_path = '/home/boris/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
map <C-p> :YcmCompleter GoTo<CR>

" Rust.vim
let g:rustfmt_autosave = 1

" NERDTree
" Open nerdtree if no files where specified to vim
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close nerdtree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

" Vim-colorschemes
colorscheme molokai

" vim-autoformat
"au BufWrite * :Autoformat
autocmd Filetype vim,text,rust let b:autoformat_autoindent=0
autocmd Filetype vim,text,rust let b:autoformat_retab = 0
autocmd Filetype vim,text,rust let b:autoformat_remove_trailing_spaces = 0


" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ALE
" Turn ale for airline
let g:airline#extenstions#ale#enabled = 1
" Changes in message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%][%linter%]: %s'
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
" Ale shortcuts
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" NERD Commenter
" Spaces after comment delimiters
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
