set shell=/bin/bash
let mapleader=","
" VIM mode
set nocompatible

noremap tdd "+dd
noremap ty "+y
noremap tY "+Y
noremap tp "+p
noremap tP "+P
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
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

" PANDOC
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown=0
let g:pandoc#modules#disabled = ["spell"]

" Set colorscheme
let g:solarized_termcolors=256
set t_Co=256
set background=dark

colorscheme solarized
