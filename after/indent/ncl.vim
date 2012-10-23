"-------------------------------------------------------------------------------
"NCL indent file
"Language: NCL
"Author: Xin Xie (xiexinyls@gmail.com)
"        School of Marine and Atmospheric Science
"        Stony Brook University
"Reference: Sebastien Burton and Ajit J. Thakkar's code for Fortran indent.
"-------------------------------------------------------------------------------
"
if exists("g:did_indent")
   finish
endif

let g:did_indent = 1

setlocal indentkeys+==~end,=~do,=~if,=~then,=~else

setlocal indentexpr=NCLIndent()

function NCLIndent()
   let lnum = Prevnonblankstat(v:lnum - 1)
   
   "zero indent from the beginning.
   if lnum ==0
      return 0
   endif

   let ind = indent(lnum)

   let prevline = getline(lnum)
   let prevstat = substitute(prevline, ';.*$', '', '')

   let curline = getline(v:lnum)
   let curstat =  substitute(curline, ';.*$', '', '')

   if prevstat =~? '^\s*\(\(if.*then\)\|do\|else\)\>'
      let ind = ind + &sw
   endif

   if curstat =~? '^\s*\(else\|\(end\s*\(do\|if\)\)\)\>'
      let ind = ind - &sw
   endif

   if ind < 0
      let ind = 0
   endif

   return ind

endfunction

function Prevnonblankstat(lnum)
   let lnum = prevnonblank(a:lnum)
   while getline(lnum) =~ '^\s*;'
      let lnum = prevnonblank(lnum-1)
   endwhile
   return lnum
endfunction

