" To spell check all git commit messages
au BufNewFile,BufRead COMMIT_EDITMSG set spell

" Underline misspelled words
hi clear SpellBad
hi SpellBad cterm=underline
