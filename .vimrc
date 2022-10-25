syntax on
set noai
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set paste

set nu
set incsearch
set hlsearch

hi LineNr ctermfg=darkgrey
hi Search term=bold ctermfg=black guifg=black ctermbg=lightblue guibg=lightblue
hi OverLength ctermbg=darkred ctermfg=white guibg=#592929
 
noremap <F3> :set hlsearch! hlsearch?<CR>
noremap <F4> :set noignorecase! ignorecase?<CR>
noremap <F9> :match none<CR>
noremap <F10> :match OverLength /\%81v.\+/ <CR>
noremap <F12> :set nonumber! nu?<CR>

au BufReadPost *.vue set syntax=html

colo default
