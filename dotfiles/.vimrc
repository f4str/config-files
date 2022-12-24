" syntax coloring
syntax enable

" show line number
set number
highlight LineNr term=bold ctermfg=DarkGrey

" show current position
set ruler

" show matching brackets
set showmatch

" filetype plugins
filetype plugin on
filetype indent on

" tabs and indents
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set copyindent
set preserveindent

" wild menu
set wildmenu
set wildignore=*.o,*~,*.pyc

" searching
set hlsearch
set incsearch

" powerline
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

