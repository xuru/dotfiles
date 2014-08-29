"let VCSCommandEnableBufferSetup=1
"
" Set the status line the way i like it
" set statusline=%f\ %m\ %r\ %{VCSCommandGetStatusLine()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set statusline+=%{fugitive#statusline()}

" let VCSCommandSVNDiffOpt='b'    " ignore space changes
" let VCSCommandMapPrefix = "<leader>v"
" let VCSCommandDeleteOnHide=1
" let VCSCommandMenuRoot='VCS'
