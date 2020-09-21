if &compatible
  set nocompatible
end

call plug#begin('~/.config/nvim')

" Make sure you use single quotes
"ruby plugins
Plug 'jgdavey/vim-blockle'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'

"javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

"sql plugins
Plug 'exu/pgsql.vim'
Plug 'tpope/vim-dadbod'

"formating plugins
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'rondale-sc/vim-spacejam'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
" staticly check code and highlight errors (async syntastic replacement)
Plug 'w0rp/ale'

"tmux plugins
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-turbux'
Plug 'tpope/vim-dispatch'

"search plugins
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"misc plugins
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haml'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'vim-syntastic/syntastic'

"git plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'

"vimwiki plugins
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'ferrine/md-img-paste.vim'

" Initialize plugin system
call plug#end()

syntax enable
filetype plugin indent on

set ignorecase

"set hybrid line numbers
set number relativenumber

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

let mapleader=","

inoremap jj <Esc>
inoremap kj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set tabstop=4 shiftwidth=4 expandtab
set hlsearch
set colorcolumn=72
set spell
set encoding=UTF-8

"colorscheme
colorscheme embark

set guifont=Monaco:h32
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=zsh

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" shows the output from prettier - useful for syntax errors
nnoremap <leader>pt :!prettier %<CR>

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

let g:rspec_command = '!bundle exec bin/rspec {spec}'
let g:javascript_plugin_jsdoc = 1

"nerdtree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

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
         \ join(['rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape('^- \[[ ]\] .+'), '~/.vim/vimwiki']), 1,
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
  let l:fzf_opts.dir = '~/.vim/vimwiki'
  let l:fzf_opts.source = 'ls -td $(fd .)'
  let l:fzf_opts.options = '--delimiter ":" --preview="bat ~/.vim/vimwiki/{1}" --preview-window=right:80'
  call fzf#run(fzf#wrap(l:fzf_opts))
endfunction
let g:vimwiki_list = [{
                      \ 'path': '~/.vim/vimwiki/',
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md',
                      \ 'auto_toc': 1,
                      \ }]
" gln to toggle forward
" glp to toggle back
let g:coc_filetype_map = { 'vimwiki': 'markdown' } " register with coc-markdownlint
let g:nv_search_paths = ['~/.vim/vimwiki']
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
  \   fzf#vim#with_preview({'dir': '~/.vim/vimwiki'}), <bang>0)
command! -bang -nargs=* EditNote call fzf#vim#files('~/.vim/vimwiki', <bang>0)
command! -bang -nargs=0 NewNote
            \ call vimwiki#base#edit_file(":e", strftime('~/.vim/vimwiki/%F-%T.md'), "")
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

"Coc autocomplete
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-python',
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"fzf
" set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:nv_window_command = 'call FloatingFZF()'
map <C-p> :FZF<cr>

noremap <Leader>a :Rg <cword><cr>
