
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

let fortran_free_source=1
"let fortran_have_tabs=1
let fortran_fold=1
let fortran_fold_conditionals=1
"let fortran_more_precise=1

au! BufRead,BufNewFile *.f90,*.F90 let b:fortran_do_enddo=1

set pastetoggle=<F11>


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
"set number

" Uncomment the following to have Vim jump to the last position when
" " reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
filetype plugin indent on
syntax on
set hlsearch

" Smart tabbing / autoindenting
set autoindent
set smarttab

" Allow backspace to back over lines
"set backspace=2
set shiftwidth=4
set tabstop=4
set expandtab

set nowrap


