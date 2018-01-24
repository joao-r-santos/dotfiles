" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" CUSTOMIZATIONS

" Sets how many lines of history VIM has to remember
set history=500

" Enable folding (fold and unfold using `za`)
set foldmethod=indent
set foldlevel=99
" space open/closes folds
nnoremap <space> za

set splitright
set splitbelow
" make a diffsplit vertical by default
set diffopt+=vertical
" Make panes equal when the windows is resized
"autocmd VimResized * wincmd =

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set these quantities to the value of ts = tabstop
set ts=4
set sts=4
set sw=4
set smarttab

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.sh
    \ set autoindent
    "\ set textwidth=79

au BufNewFile,BufRead *.js, *.html, *.css, *.sql
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" replace tabs with spaces
set expandtab

set ignorecase          " Ignore case when searching
set smartcase           " Consider case if the search pattern contains upper case characters
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Show matching brackets when text indicator is over them
set showmatch

set number " show line numbers in vim
set relativenumber " show relative line numbers
highlight LineNr ctermfg=Grey ctermbg=0 guifg=DarkGrey guibg=Grey90
highlight CursorLineNr cterm=bold ctermfg=White ctermbg=0 gui=bold guifg=Grey guibg=Grey90
"set cursorline  " highlight current line

" visual autocomplete for command menu
set wildmenu
set wildignorecase
"set fileignorecase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" shortcuts with leader as '\' by default
" Leader Shortcuts {{{
"let mapleader=","
" Disable highlight when <leader><space> is pressed
map <leader><space> :nohlsearch<cr>
"map <leader>/ :nohlsearch<cr>
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nmap <leader>n :set invnumber invrelativenumber<cr>
" Fast saving
nmap <leader>w :w<cr>
nmap <leader>W :w!<cr>
" Fast exit
" nmap <leader>q :q<cr>
nmap <leader>q :qa<cr>
nmap <leader>Q :qa!<cr>
nmap <leader>x :x<cr>
" Open/closes folds
"nnoremap <leader>z za
" Resize windows
nnoremap <leader>= <C-W>=
" Comment / uncomment shortcut
noremap <leader>/ :Commentary<cr>
noremap <C-_> :Commentary<cr>
" Update the diff highlighting and folds
nmap <leader>du :diffupdate<cr>
" }}}

" Put all temporary files under the same directory
set backup
set backupdir=$HOME/.tmp,$HOME/tmp,/tmp,.,~/
"set backupext=-vimbackup
set undofile
set undodir=$HOME/.tmp,$HOME/tmp,/tmp,.,~/

" Spell checking
"set spell spelllang=en_us

" Mark extra whitespace as bad
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.sh,*.sql,*.txt,*.js,*.html,*.css match BadWhitespace /\s\+$/

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.py,*.pyw,*.c,*.h,*.sh,*.sql,*.txt,*.js,*.html,*.css,*.wiki,*.coffee :call CleanExtraSpaces()
endif


"set encoding=utf-8

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" Set up powerline status bar
set rtp+=~/miniconda2/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
" Change font on desktop computer
"if has('gui_running')
"    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11.5
"    "set guifont=Noto\ Mono\ for\ Powerline\ Medium\ 10
"    "set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
"endif
