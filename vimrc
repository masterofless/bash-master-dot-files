set cursorline
set ts=3
set shiftwidth=3
set expandtab
set nowrap
set textwidth=400
set ai
set wildmode=longest,list,full
set wildmenu

ab teh the

" markdown plugin adaptations, untested
au BufNewFile,BufRead *.md set ft=md
au BufNewFile,BufRead *.md set textwidth=400

" pretty colors
so ~/.janus/ScrollColor.vim
colo fruity

" tree mode
let g:netrw_liststyle=3
let g:netrw_sort_by="time"
let g:netrw_sort_direction="reverse"
