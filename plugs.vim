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
Plug 'elmcast/elm-vim'

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
Plug 'mhinz/vim-startify'

"git plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'

"vimwiki plugins
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'mattn/calendar-vim'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'ferrine/md-img-paste.vim'

"snippets plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()
