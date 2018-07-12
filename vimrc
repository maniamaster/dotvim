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
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Bundle 'klen/python-mode'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'davidhalter/jedi-vim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'easymotion/vim-easymotion' 

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


"#####################################################
"Test if properly synced:
command! Status echo "All systems are go!"

map <F2> :NERDTreeToggle<CR>

"easier split navigation:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


"my own personalization:"
"
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endwhile
set timeout ttimeoutlen=50

"folding:"
:setlocal foldmethod=syntax

"powerline:"
set laststatus=2

"for python"
set encoding=utf-8

filetype on               

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

"fancy color scheme:" may disable alt and str key combinations
"set term=screen-256color

if &term =~ '256color'
      " disable Background Color Erase (BCE) so that color schemes
      " render properly when inside 256-color tmux and GNU screen.
      " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
      set t_ut=
endif

set t_Co=256
colorscheme zenburn
"SET THIS AFTER WINDOWS CREATOR UPDATE!!!!"

set nu

"python:

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0 

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let g:jedi#rename_command = "<C-p>"




"scrolling border:
set scrolloff=5
"intendation:
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
"
set number
set showcmd
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
inoremap jj <Esc>
inoremap jk <Esc>
nnoremap <leader>u :GundoToggle<CR>
"colorscheme slate
"Michael"
syntax on
"set spell
"set spelllang=de,en
set number
filetype plugin on
filetype plugin indent on
set smartindent
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
map <F12> <c-s>:!make Prohaupt.pdf<CR><CR>
imap <F12> <c-s>:!make Prohaupt.pdf<CR><CR>
:nmap <c-s> :w<CR>
:imap <c-s> <Esc><c-s>
"
""Latex Suite
"
""
let g:tex_flavor='latex'
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
  filetype plugin on
"  "
"  " " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
"  " " can be called correctly.
"  " set shellslash
"  "
"  " " IMPORTANT: grep will sometimes skip displaying the file name if you
"  " " search in a singe file. This will confuse Latex-Suite. Set your grep
"  " " program to always generate a file-name.
   set grepprg=grep\ -nH\ $*
"   "
"   " " OPTIONAL: This enables automatic indentation as you type.
"   " filetype indent on
"   "
"   " " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files
"   defaults
"   " to
"   " " 'plaintex' instead of 'tex', which results in vim-latex not being
"   loaded.
"   " " The following changes the default filetype back to 'tex':
"    let g:tex_flavor='latex'
"
"
"EASYMOTION:

map <Leader> <Plug>(easymotion-prefix)

