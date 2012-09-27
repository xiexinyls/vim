
This directory contains some useful ncl syntax, indent, and dictionary settings.

To use them, put the directory structure into your .vim directory.

Turn on the filetype plugin and syntax
by adding the following lines to your .vimrc file:

filetype plugin indent on
syntax on



To indent the current line, simply type "=="

To indent the whole ncl file, type "gg=G"



Known problem:
When you use "else if" statement like this,

if ( condition ) then
  ...
else if ( condition ) then
  ...
else if ( condition ) then
  ...
end if
end if
end if

the indent code may not work right. To avoid that, try the following code style

if ( condition ) then
  ...
else

  if ( condition ) then
    else

       if ( condition ) then
         ...
       end if
  end if
end if

