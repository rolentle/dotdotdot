" vimwiki & friends
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vimwiki_hl_headers = 1 " highlight headers with different colors
let g:vimwiki_hl_cb_checked = 2 " highlight completed tasks and line
" trying to make markdown snippets work
" let g:vimwiki_table_mappings=0
" autocmd FileType vimwiki UltiSnipsAddFiletypes vimwiki
au BufEnter *.md setl syntax=markdown " do not set syntax to 'vimwiki'
let g:vimwiki_global_ext = 0 " don't hijack all .md files
let g:vimwiki_listsyms = ' ○◐●✓'
" show all uncompleted todos with FZF and preview
command! -bang -nargs=* WikiTodos
         \ call fzf#vim#grep(
         \ join(['rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape('^- \[[ ]\] .+'), '~/.config/nvim/vimwiki']), 1,
         \ fzf#vim#with_preview(), <bang>0)
" NV-fzf floating window
function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
             \ 'row': (&lines - height) / 2,
             \ 'col': (&columns - width) / 2,
             \ 'width': width,
             \ 'height': height,
             \}
  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
endfunction
let g:nv_window_command = 'call FloatingFZF()'
" list of all files and sub-directory path'd files sorted by date modified
" function! g:init_funcs#fzf_nv()
function! SortWiki()
  let l:fzf_opts = {}
  let l:fzf_opts.sink = 'e'
  let l:fzf_opts.dir = '~/.config/nvim/vimwiki'
  let l:fzf_opts.source = 'ls -td $(fd .)'
  let l:fzf_opts.options = '--delimiter ":" --preview="bat ~/.config/nvim/vimwiki/{1}" --preview-window=right:80'
  call fzf#run(fzf#wrap(l:fzf_opts))
endfunction
let g:vimwiki_list = [{
                      \ 'path': '~/.config/nvim/vimwiki/',
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md',
                      \ 'auto_toc': 1,
                      \ }]
" gln to toggle forward
" glp to toggle back
let g:coc_filetype_map = { 'vimwiki': 'markdown' } " register with coc-markdownlint
let g:nv_search_paths = ['~/.config/nvim/vimwiki']
nmap <Leader>wv :NV<CR>
nmap <Leader>wdn <Plug>VimwikiMakeDiaryNote
nmap <Leader>wdy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>wdt <Plug>VimwikiMakeTomorrowDiaryNote
" nmap <Leader>wp :Files ~/.vim/vimwiki/<CR>
" find incomplete items and add to quickfix
function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction
function! VimwikFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction
nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
" other ones to try
command! -bang -nargs=* SearchNotes
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'dir': '~/.config/nvim/vimwiki'}), <bang>0)
command! -bang -nargs=* EditNote call fzf#vim#files('~/.config/nvim/vimwiki', <bang>0)
command! -bang -nargs=0 NewNote
            \ call vimwiki#base#edit_file(":e", strftime('~/.config/nvim/vimwiki/%F-%T.md'), "")
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType markdown nmap <buffer> <silent> gf <Plug>VimwikiFollowLink<CR>
" autocmd Filetype purescript nmap <buffer> <silent> K :Ptype<CR>
" map <cr> to A <cr> ?
" augroup VimwikiKeyMap
"     autocmd!
"     autocmd FileType vimwiki inoremap <silent><buffer> <CR>
"                 \ <C-]><Esc>:VimwikiReturn 3 5<CR>
" augroup END
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
