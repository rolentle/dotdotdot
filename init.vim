if &compatible
  set nocompatible
end

filetype plugin indent on
source ~/.config/nvim/plugs.vim

syntax enable
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

set ignorecase

set number

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
" set background=light
" colorscheme solarized8
"
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme spaceduck
let g:airline_theme = 'spaceduck'
set guifont=Monaco:h32
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=zsh

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" shows the output from prettier - useful for syntax errors
nnoremap <leader>pt :!prettier %<CR>

source ~/.config/nvim/ale.vim

let g:javascript_plugin_jsdoc = 1

source ~/.config/nvim/vimwiki.vim
source ~/.config/nvim/nerdtree.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf_search.vim

nnoremap <leader>a :Rg <c-r>=expand("<cword>")<cr><cr>
let g:python3_host_prog = "/usr/local/bin/python3"

"" coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = '!bundle exec rspec {spec}'
" let g:rspec_command = '!./bin/rspec {spec}'
let @" = expand("%")
