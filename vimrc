execute pathogen#infect()

ab teh the
let mapleader = ","
set background=dark
colo gruvbox
"colo candy
"colo solarized
syntax enable
filetype plugin on

set printfont=Courier:h16
setglobal textwidth=0
set textwidth=0
set smarttab
set expandtab tabstop=3 softtabstop=3 shiftwidth=3
set nu
set ai
set nobackup
set noswapfile
set cursorline
set showcmd
set hidden " so buffers can be dirty and invisible
set history=2000
set undolevels=100
set wildignore=*.sqp,*.bak,*.pyc,*.class
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.so,*.swp,*.zip
set wildmode=longest,list,full
set wildmenu
set list
set tags=+.tags
set ignorecase
set hlsearch
set nowrap
set foldlevel=10

let g:netrw_liststyle=3
let g:netrw_sort_by="time"
let g:netrw_sort_direction="reverse"
let g:vim_markdown_initial_foldlevel=1
"let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|tmp|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search
    history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"au BufWritePre *.txt,*.java,*.xml,*.sh,*.rb :call <SID>StripTrailingWhitespaces()
au BufRead,BufNewFile *.sh,*bash* set filetype=sh
au BufRead,BufNewFile *.md set ft=md textwidth=400 fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1 fdm=expr spell spelllang=en_us wrap expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufRead,BufNewFile *.css set wrap expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufRead,BufNewFile *.js set ft=javascript expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.html set ft=html expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.g* set fdm=manual textwidth=0 tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.txt set filetype=text expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufRead,BufNewFile *.snippets set expandtab
au BufRead,BufNewFile *.yml set noai
au BufRead,BufNewFile *.adoc set ft=asciidoc
au BufRead,BufNewFile *.tf set expandtab tabstop=2 softtabstop=2 shiftwidth=2

map <leader>N :NERDTreeToggle<CR>
noremap % v%
let NERDTreeWinSize=50
map <leader>o :only<CR>
map <leader>m :MRU<CR>
map <leader>b :BufExplorer<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
