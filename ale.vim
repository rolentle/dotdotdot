" Plugin Configuration: {{{

  " ALE: {{{
    let g:ale_sign_error = 'X'
    let g:ale_sign_warning = '!'
    highlight link ALEWarningSign ErrorMsg
    highlight link ALEErrorSign WarningMsg
    nnoremap <silent> <leader>ne :ALENextWrap<CR>
    nnoremap <silent> <leader>pe :ALEPreviousWrap<CR>

    let g:ale_fixers = {
          \   'javascript': ['prettier'],
          \   'javascript.jsx': ['prettier'],
          \   'typescript': ['prettier'],
          \   'json': ['prettier'],
          \   'scss': ['prettier'],
          \   'ruby': ['rubocop'],
          \   'bash': ['shfmt'],
          \   'zsh': ['shfmt'],
          \   'elixir': ['mix_format'],
          \}

    let g:ale_linters = {'c': ['clang'], 'cpp': ['g++']}
    let g:ale_fix_on_save = 1
  " }}}

" }}}
