
"for NCL filetype detect and autocomplete

"au BufRead,BufNewFile *.ncl set filetype=ncl
au BufRead,BufNewFile *.ncl setf ncl
"au! Syntax newlang source $VIM/ncl.vim

"Show autocomplete menus.
set complete-=k complete+=k " Add dictionary search (as per dictionary option)
set wildmode=list:full
set wildmenu
au BufRead,BufNewFile *.ncl set dictionary=~/.vim/dictionary/ncl.dic


