" .vimrc - Vim configuration file.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                 " be iMproved, required
filetype off                     " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'    " plugin manager

Plugin 'vim-scripts/taglist.vim' " taglist browser
Plugin 'yegappan/mru'            " most recently used
Plugin 'scrooloose/nerdtree'     " file explorer
Plugin 'scrooloose/nerdcommenter'

Plugin 'SirVer/ultisnips'        " snippets engine
Plugin 'honza/vim-snippets'      " snippets files for various programming languages
"Plugin 'vim-scripts/snipMate'

Plugin 'vim-scripts/OmniCppComplete'  "omni-completion with ctags database
"Plugin 'justmao945/vim-clang'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/AutoComplPop'     "automatically opens popup menu for completions
Plugin 'iamcopper/auto-pairs'    " insert or delete brackets, parens, quotes in pair

Plugin 'vim-scripts/a.vim'       " Alternate between *.c and *.h

Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
"filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist.vim
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1
" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
" OmniCppComplete.vim
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2
" vim-airline (only for xterm)
set term=xterm-256color

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set	nocompatible                 " out of VI compatible mode.
set	nobackup                     " do not create backup file
set	autoread                     " auto read file that has been changed on disk
set	autowrite                    " auto save before commands like :next and :make
set	backspace=indent,eol,start   " backspace can delete everything
set	history=100                  " number of recorded history command
set	helpheight=10                " minimal initial height of the help window
set	hidden                       " enable multiple modified buffers
set	mouse=a                      " allow using mouse in all mode
set	wildignore=.svn,.git,*.swp,*.bak,*.o,*.e,*~

filetype plugin indent on        " enable auto detect file type and automatically indent by filetype

" indent
set	autoindent                   " automatically indent new line same as previous line
set	smartindent                  " do smart autoindenting when starting a new line
set	cinoptions=:0                " set indent style in context
set	shiftwidth=4                 " number of spaces to indent each level
set	noexpandtab                  " no expand tabs into spaces
set	tabstop=4                    " number of spaces in a tab

" auto complete
set	completeopt=longest,menuone  " auto complete options (insert mode)
set	pumheight=10                 " maximum height of the popup menu

" display options
color	mycolor                  " custom color scheme
set	background=dark
syntax	on                       " syntax highlighting.
set	cursorline                   " highlight the screen line of the cursor
set	number                       " show line number
set	laststatus=2                 " always show the status line
set	ruler                        " line and column number of the cursor position
set	showcmd                      " show (partial) command in status line
set	scrolloff=5                  " minimal number of screen lines to keep beyond the cursor
set	list                         " show <tab>
set	listchars=tab:-\ ,trail:.    " <tab> show as '- ', <space> show as '.'

" wrap
set	textwidth=0                  " do not wrap words (insert)
set	nowrap                       " do not wrap words (view)
"set	whichwrap=h,l                " allow specified keys that can move across line

" file encoding and format
set	encoding=utf-8
set	fileencoding=utf-8
set	fileencodings=utf-8,gb2312,gbk,gb18030
set	termencoding=utf-8
set	fileformat=unix

" fold
set	foldenable                   " enable folde the text content
set	foldmethod=marker            " the kind of folding

" search
set	hlsearch                     " highlight search match
set	ignorecase                   " do case insensitive matching
set	smartcase                    " do not ignore if search pattern has CAPS
set	incsearch                    " incremental search

" command completion
set	wildmenu                     " enhanced command completion
set	wildmode=list:longest,full   " command completion mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set mapleader
let mapleader=","

" Space to command mode.
nnoremap <space> :
vnoremap <space> :

" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

nmap  <F2> :TlistToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
nmap  <F4> :MRU<cr>
nmap  <F5> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>

function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
