" Description: Search Dash.app from Vim
if isdirectory(expand("~/.vim/bundle/dash.vim"))

    let g:dash_map = {
          \ 'ruby' : 'ruby_on_rails',
          \ 'python' : ['python2', 'sopython'],
          \ 'javascript' : 'javascripts',
          \ 'coffee' : 'javascripts',
          \ 'eruby' : 'rails_views',
          \ 'scss' : 'css',
          \ 'sass' : 'css',
          \ 'css' : 'css',
          \ 'vim' : 'vim'
          \ }

    :nmap <silent> <leader>m <Plug>DashSearch
endif
