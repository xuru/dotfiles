" When create .c,.h,.sh,.java, auto complete file infomation
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.md exec ":call SetTitle()" 
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."),   "\# File:   ".expand("%")) 
        call append(line(".")+1, "\# Author: Tau (guantau@163.com)") 
        call append(line(".")+2, "\# Date:   ".strftime("%Y.%m.%d")) 
        call append(line(".")+3, "\#########################################################################") 
        call append(line(".")+4, "\#!/bin/bash") 
        call append(line(".")+5, "") 
        call append(line(".")+6, "") 
    elseif &filetype == 'python'
        call setline(1,"#-*- coding: utf-8 -*-")
        call append(line("."),"'''")
        call append(line(".")+1, "\# File:   ".expand("%")) 
        call append(line(".")+2, "\# Author: Tau (guantau@163.com)") 
        call append(line(".")+3, "\# Date:   ".strftime("%Y.%m.%d")) 
        call append(line(".")+4, "Description: ") 
        call append(line(".")+5,"'''")
        call append(line(".")+6, "") 
        call append(line(".")+7, "") 
    elseif &filetype == 'mkd'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: tau") 
        call append(line(".")+2, "    > Mailto: guantau@163.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%Y.%m.%d")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%"))
        call append(line(".")+7,"")
    endif
    exec "normal G"
endfunc 

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        exec "! ./%"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype == 'mkd'
"        exec "!touch ~/temp.html"
"        exec "!perl ~/.vim/markdown.pl % > /tmp/temp.html<"<CR>
"        exec "!markdown % > /tmp/temp.html<"<CR>
"        exec "md"
        exec "!firefox /tmp/markdown.html &"
    endif
endfunc

func! RunDebug()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -g -o %<"
        exec "!gdb ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -g -o %<"
        exec "!gdb ./%<"
    elseif &filetype == 'python'
        exec "!pudb %"
    elseif &filetype == 'python'
        exec "!php -l %"
    endif
endfunc
