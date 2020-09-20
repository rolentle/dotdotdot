" vim: ft=vim
" Vim Plugins via Vim Plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if &compatible
  set nocompatible
end

call plug#begin('~/.config/nvim')

" Make sure you use single quotes
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-blockle'
Plug 'jgdavey/vim-turbux'
Plug 'leshill/vim-json'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'rondale-sc/vim-spacejam'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'exu/pgsql.vim'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug '/usr/local/opt/fzf'
Plug 'vim-syntastic/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

" staticly check code and highlight errors (async syntastic replacement)
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

syntax on
filetype plugin indent on

set ignorecase
set smartcase
set number

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

let mapleader=","
syntax enable

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
colorscheme solarized
let g:solarized_termcolors=256
set background=light

set guifont=Monaco:h16
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
set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

noremap <Leader>a :Ack! <cword><cr>

