set shell=/bin/bash
let mapleader=","
" VIM mode
set nocompatible

" General settings
set nohidden            " No buffer when tab is closed
set fileencoding=utf-8	" Save files as utf-8
set mouse=a             " Enable mouse

" Display settings
set encoding=utf-8	" Visual encoding
set ruler		" Show cursor position
set showmatch		" Highlights matching braces
set showmode		" Shows current mode
set showcmd             " Shows command in writing
set wildmenu            " Tab completion
set wildmode=list:longest,full
set number              " Show line numbers
set cmdheight=2         " Two lines high commands line
set visualbell          " Visual nagging, not verbal

" Typing and edit settings
set confirm		" :q in case of unsaved changes
set nobackup		" ~backup file removed
set backspace=indent,eol,start " Backspace behavior
set expandtab           " Tab to spaces
set shiftwidth=4        " 4 spaces for indent
set softtabstop=4       " Set tab stop
set shiftround          " Round indents to multiples of shiftwidth
set copyindent          " Copy existing indents
set preserveindent      " Preserve indent settings in file

" Search settings
set hlsearch 		" Highlight search results
set ignorecase		" Ignore case in search 
set smartcase 		" If upper case is used in search, do not ignore case
set incsearch		" Increments search results



" Filetype specific settings
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype specific indenting
filetype plugin on      " Enable filetype specific plugins
set autoindent smartindent " auto/smart indent
syntax on

" Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'vimwiki/vimwiki'
"Plugin 'gabrielelana/vim-markdown'

call vundle#end()


let wiki_0 = {}
let wiki_0.path = '~/OneDrive/Notes/'
let wiki_0.syntax = 'markdown'
let wiki_0.ext = '.md'

let wiki_1 = {}
let wiki_1.path = '~/OneDrive/Notes/School/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/OneDrive/Notes/Personal/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let wiki_3 = {}
let wiki_3.path = '~/OneDrive/Notes/Knowledge/'
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'

let wiki_4 = {}
let wiki_4.path = '~/OneDrive/Notes/Work/'
let wiki_4.syntax = 'markdown'
let wiki_4.ext = '.md'

let g:vimwiki_list = [wiki_0, wiki_1, wiki_2, wiki_3, wiki_4]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Set colorscheme
colorscheme afterglow
