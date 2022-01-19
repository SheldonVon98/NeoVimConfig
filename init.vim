"*********************************************************************
" Neovim configuration
" 
" Specialized for 
" Sheldon Fung
"
" ********************************************************************

call plug#begin('~/.vim/plugged')
" Cool startup screen
Plug 'mhinz/vim-startify'

" gruvbox theme
Plug 'morhetz/gruvbox'

"vim-airline bottom status bar optimization
Plug 'bling/vim-airline'

" Code completion
Plug 'davidhalter/jedi-vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'HansPinckaers/ncm2-jedi'

"vim-autopep8 auto format
Plug 'tell-k/vim-autopep8'

" snipmate template completion
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug 'honza/vim-snippets'

" auto curly bracket
Plug 'jiangmiao/auto-pairs'

"nerdtree file tree
Plug 'scrooloose/nerdtree'

" floating terminal
Plug 'voldikss/vim-floaterm'

" Tabs
Plug 'akinsho/bufferline.nvim'

" Initialize plugin system
call plug#end()

" Remove snipmate warning
let g:snipMate = { 'snippet_version' : 1 }


" ******************** Key Mapping ***********************
" F3 toggle file tree
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" F6 auto format
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR><Paste>



" ******************** Plugin Configuration ***********************
" Open NERDTree by defualt
let NERDTreeChDirMode  = 2   " Set current folder as NERDTREE root      
let NERDChristmasTree  = 1   " Better NERDTREE window appearance
let NERDTreeMouseMode  = 1   " Open file on double click
let NERDTreeWinSize    = 25  " Set window width size to be 25
let NERDTreeQuitOnOpen = 1   " Close NERDTree window when new file is opened

" auto format
"vim-autopep8 no diff hint
let g:autopep8_disable_show_diff=1

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menu,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" Delay window pop (for fluency)
let ncm2#popup_delay = 5
" Pop window at [[minimum priority, minimum length]]
let ncm2#complete_length = [[1, 3]]
" fuzzy match mode
let g:ncm2#matcher = 'substrfuzzy'
" Choose pop window content (downwards) with space
" inoremap <expr> <S> pumvisible() ? "\<C-n>" : "\<S>" 
" Choose pop window content (upwards) with Tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-p>" : "\<Tab>" 

"jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
" following function requires auto_initialization=1
let g:jedi#show_call_signatures = 1

" float term
noremap  <leader>t  :FloatermToggle<CR>
noremap! <leader>t  <Esc>:FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_width = 100
let g:floaterm_winblend = 0

" bufferline
lua << EOF
require("bufferline").setup{}
EOF

" ********************** Normal Configuration ************************
" Set history record number
set history=1000  
" Disable vi keyboard mode
set nocompatible
" Grammar highlight
syntax on

" Substitude filetype
filetype off 
filetype plugin indent on

" ignore case when search, disable with set noic
set ic
" highlight when search
set hlsearch

set encoding=utf-8
set number

" Indent
" Indent as the above line
set autoindent
" smart indent
set smartindent
set scrolloff=4
set showmatch
set backspace=indent,eol,start

" Auto save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHoldI", "CompleteDone"]

" ctrl-j/k/l/h  Split window move (Normal mode)
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

"******************* Python Configuration *****************
" grammar highlight
let python_highlight_all=1
" Set tab to be 4
au Filetype python set tabstop=4
" Set tab width in edit mode
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
autocmd FileType python map <buffer> <C-b> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ################################## vim theme appearance ##################################
set background=dark             
set cursorline                  " highlight current row
colorscheme gruvbox             " set gruvbox theme
" ************** vim color **************
hi vertsplit ctermbg=bg guibg=bg
hi GitGutterAdd ctermbg=bg guibg=bg
hi GitGutterChange ctermbg=bg guibg=bg
hi GitGutterDelete ctermbg=bg guibg=bg
hi GitGutterChangeDelete ctermbg=bg guibg=bg
hi SyntasticErrorSign ctermbg=bg guibg=bg
hi SyntasticWarningSign ctermbg=bg guibg=bg
hi FoldColumn ctermbg=bg guibg=bg


" #################################### Title ##############################

func SetTitle()
    "if file type is .sh
    if &filetype == ‘sh‘
	call setline(1,"\#########################################################################")

        call append(("."), "\# File Name: ".expand("%"))

        call append(line(".")+1, "\# Author: Sheldon Fung")

        call append(line(".")+2, "\# mail: ShelvonVon@outlook.com")

        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))

        call append(line(".")+4, "\#########################################################################")

        call append(line(".")+5, "\#!/bin/bash")

        call append(line(".")+6, "")

     else

	call setline(1, "/*************************************************************************")

        call append(line("."), "    > File Name: ".("%"))

        call append(line(".")+1, "    > Author: YourName")

        call append(line(".")+2, "    > Mail: YourEmail ")

        call append((".")+3, "    > Created Time: ".strftime("%Y-%m-%d",localtime()))

        call append((".")+4, " ************************************************************************/")

        call append(line(".")+5, "")

     endif

     if &filetype == ‘cpp‘

        call append(line(".")+6, "#include<iostream>")

         call append(line(".")+7, "using namespace std;")

        call append(line(".")+8, "")

    endif

    if &filetype == ‘c‘

         call append(line(".")+6, "#include<stdio.h>")

       call append(line(".")+7, "")

    endif
 
    " Point to the end of the file when create a new file
    autocmd BufNewFile * normal G
endfunc

" Python
autocmd BufNewFile *py exec ":call SetPythonTitle()"
func SetPythonTitle()

	call setline(1,"# Copyright (c) SheldonFung All Rights Reserved.")
  	call append(line("."), "\# File Name: ".expand("%"))
  	call append(line(".")+1, "\# Author: Sheldon Fung")
  	call append(line(".")+2, "\# email: sheldonvon@outlook.com")
  	call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
endfunc

" Point to the end of the file when create a new file
autocmd BufNewFile * normal G o
