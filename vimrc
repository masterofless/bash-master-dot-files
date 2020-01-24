execute pathogen#infect()
set laststatus=2
ab teh the
ab idff diff
let mapleader = ","
set background=dark
"colo gruvbox
"colo candy
"colo solarized
"colo candycode
colo dante
syntax enable
filetype plugin on
setglobal nospell
set nonu
set printfont=Courier:h16
setglobal textwidth=0
set textwidth=0
set smarttab
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set clipboard=unnamed
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
au BufRead,BufNewFile *.sh,*bash* setlocal ft=sh nu
au BufRead,BufNewFile *.md setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 ft=markdown textwidth=400 fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1 fdm=expr spell spelllang=en_us wrap
au BufRead,BufNewFile *.css setlocal wrap expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufRead,BufNewFile *.js setlocal ft=javascript expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.html setlocal ft=html expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.g* setlocal fdm=manual textwidth=0 tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.txt setlocal ft=text expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufRead,BufNewFile *.py,*.php setlocal ft=python expandtab tabstop=4 softtabstop=4 shiftwidth=4 nu
au BufRead,BufNewFile *.snippets setlocal expandtab
au BufRead,BufNewFile *.yml,*.yaml setlocal noai expandtab tabstop=2 softtabstop=2 shiftwidth=2 ft=yaml
au BufRead,BufNewFile *.adoc setlocal ft=asciidoc
au BufRead,BufNewFile *.tf setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile Dockerfile setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.cs setlocal nu
au BufRead,BufNewFile *.sql setlocal nu
au BufRead,BufNewFile *.csv setlocal nu
au BufRead,BufNewFile *.load setlocal nu
au BufRead,BufNewFile *.xml setlocal wrap
au BufRead,BufNewFile *.bal setlocal ft=bal nu expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufRead,BufNewFile *.go setlocal ft=go nu tabstop=4 softtabstop=4 shiftwidth=4

map <leader>N :NERDTreeToggle<CR>
noremap % v%
let NERDTreeWinSize=50

" set up some key maps
map <leader>o :only<CR>
map <leader>m :MRU<CR>
map <leader>b :BufExplorer<CR>
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif
