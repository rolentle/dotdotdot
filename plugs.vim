call plug#begin('~/.config/nvim')

" Make sure you use single quotes
"ruby plugins
Plug 'jgdavey/vim-blockle'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
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
Plug 'vim-syntastic/syntastic'
Plug 'lifepillar/vim-solarized8'


"colors plugins
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'josegamez82/starrynight'
Plug 'lifepillar/vim-solarized8'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
