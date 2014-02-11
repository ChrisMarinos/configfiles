" -------------------------------------------------------------
" vundle
" -------------------------------------------------------------
set nocompatible
filetype on "prevent vim from returning a non-zero error code when filetype is already off
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bufexplorer.zip'
Bundle 'kevinw/pyflakes-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'klen/python-mode'
Bundle 'scrooloose/syntastic'
Bundle 'trailing-whitespace'
Bundle 'trailing-whitespace'
Bundle 'joonty/vdebug.git'

filetype plugin indent on

" -------------------------------------------------------------
" python
" -------------------------------------------------------------

let g:pymode_folding=0
let g:pymode_utils_whitespaces=0
let g:pymode_motion=0
let g:pymode_lint=0
let g:pymode_lint_onfly=1
let g:pymode_lint_message=1
let g:pymode_doc_key='<Leader>pi'
map <Leader>pd :RopeGotoDefinition<CR>
map <Leader>pr :RopeRename<CR>
map <Leader>pi :RopeShowDoc<CR>
map <Leader>po :RopeFindOccurrences<CR>

" -------------------------------------------------------------
" syntastic
" -------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers=["flake8"]

" -------------------------------------------------------------
" vdebug
" -------------------------------------------------------------

let g:vdebug_options= {"timeout" : 1000 }


syntax on

set showmode

set showmatch

set number

set backspace=2

set wildmenu
set wildmode=longest,list

" tabs #TheWorst
set tabstop=4
set shiftwidth=4
set copyindent
set preserveindent
inoremap <S-Tab> <C-V><Tab>

function! TabToggle()
    if &expandtab
        set noexpandtab
    else
        set expandtab
    endif
endfunction

nmap <leader><Tab> mz:execute TabToggle()<CR>'z

" only use case sensitivity if there is a cap in
" search pattern
set ignorecase
set smartcase

set ruler

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" buffer related
set hidden
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>g :e#<CR>

" highlight lines over 80 chars
highlight OverLength ctermbg=darkgrey guibg=#FFD9D9
match OverLength /\%81v.\+/

" use solarized for pretty colors
set background=dark
colorscheme solarized

inoremap <C-space> <C-n>

" show tabs
set listchars=tab:>.
set list

" grep current word in directory
map <Leader>w :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
