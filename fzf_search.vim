"fzf
" set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:nv_window_command = 'call FloatingFZF()'
map <C-p> :FZF<cr>
