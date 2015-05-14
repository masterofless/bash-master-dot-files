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
au BufRead *bash* set filetype=sh
au BufRead,BufNewFile *.xml,*.feature,*.rb,*.js,*.html set tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.md set ft=md textwidth=400 fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1 fdm=expr tabstop=3 softtabstop=3 shiftwidth=3
au BufRead,BufNewFile *.md setlocal spell spelllang=en_us
au BufRead,BufNewFile *.g* set fdm=manual textwidth=0
au BufRead,BufNewFile *.txt set filetype=text
au BufRead,BufNewFile *.groovy set tabstop=3 softtabstop=3 shiftwidth=3
au BufRead,BufNewFile *.snippets set expandtab

map <leader>N :NERDTreeToggle<CR>
noremap % v%
let NERDTreeWinSize=50
