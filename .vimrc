" -------------------------------------------------------------
set nocompatible
filetype on "prevent vim from returning a non-zero error code when filetype is already off
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'bufexplorer.zip'
Plugin 'kevinw/pyflakes-vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'trailing-whitespace'
Plugin 'joonty/vdebug.git'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junkblocker/patchreview-vim'
Plugin 'jeetsukumaran/vim-buffergator'

call vundle#end()
filetype plugin indent on

" -------------------------------------------------------------
" python
" -------------------------------------------------------------

" let g:pymode_folding=0
let g:pymode_utils_whitespaces=0
let g:pymode_motion=0
let g:pymode_lint=1
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_lint_onfly=1
let g:pymode_lint_unmodified=1
let g:pymode_lint_message=1
let g:pymode_lint_cwindow = 0
let g:pymode_doc_key='<Leader>pi'

let g:pymode_rope_goto_definition_bind = '<Leader>pd'
let g:pymode_rope_rename_bind = '<Leader>pr'
let g:pymode_rope_organize_imports_bind = '<Leader>poi'
let g:pymode_rope_autoimport_bind = '<Leader>pi'
let g:pymode_rope_extract_method_bind = '<Leader>pem'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_trim_whitespaces = 0

" -------------------------------------------------------------
" syntastic
" -------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_python_checkers=["flake8"]
let g:syntastic_javascript_checkers=["eslint"]
let g:syntastic_scss_checkers=["scss_lint"]

" -------------------------------------------------------------
" jsdoc
" -------------------------------------------------------------
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_access_descriptions = 2
let g:jsdoc_allow_shorthand = 1
let g:jsdoc_param_description_separator = ' - '
nnoremap <Leader>jd :JsDoc<CR>

" -------------------------------------------------------------
" vdebug
" -------------------------------------------------------------
"
let g:pyflakes_use_quickfix = 0

let g:vdebug_options= {"timeout" : 1000 }


syntax on

set showmode

set showmatch

set number

set backspace=2

set wildmenu
set wildmode=longest,list

" tabs
set copyindent
set preserveindent
inoremap <S-Tab> <C-V><Tab>

function! TabToggle()
    if &expandtab
        set noexpandtab
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
    else
        set expandtab
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
    endif
endfunction

set expandtab
execute TabToggle()

nmap <leader><Tab> mz:execute TabToggle()<CR>'z

" only use case sensitivity if there is a cap in
" search pattern
set ignorecase
set smartcase

" stautsline
"set ruler
let g:gitgutter_realtime=1
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline_section_x = 0

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" buffer related
set hidden
nnoremap <Leader>bq :bufdo :bdelete<CR>

" go to last opened buffer
nnoremap <Leader>g :e#<CR>

" highlight lines over 80 chars
highlight OverLength ctermbg=darkgrey guibg=#FFD9D9
match OverLength /\%81v.\+/

" use solarized for pretty colors
set background=dark
colorscheme solarized
set listchars=tab:→\ 
set list
hi SpecialKey ctermfg=2 ctermbg=8

inoremap <C-space> <C-n>

" grep current word in directory
map <Leader>w :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

set foldlevelstart=20

:command -nargs=+ Gfind execute 'Ggrep' <q-args> | cw


" quickfix shortcuts
nnoremap <Leader>cn :cn<CR>
nnoremap <Leader>cp :cp<CR>


" nerd tree
map <Leader>t :NERDTreeToggle<CR>

"ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" buffergator
let g:buffergator_viewport_split_policy = 'B'
let g:buffergator_split_size = 10
