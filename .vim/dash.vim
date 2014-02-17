" Description: Search Dash.app from Vim

let g:dash_map = {
      \ "ruby" : "ruby_on_rails",
      \ "python" : "python2",
      \ "javascript" : "javascripts",
      \ "coffee" : "javascripts",
      \ "eruby" : "rails_views",
      \ "scss" : "csses",
      \ "sass" : "csses",
      \ "css" : "csses"
      \ }

:nmap <silent> <leader>m <Plug>DashSearch
