call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'alvan/vim-closetag'
" Plug 'mechatroner/rainbow_csv'
" Plug 'w0rp/ale', {'do': 'pip3 install --user flake8 pylint yapf yamllint vim-vint ; npm install -g standard stylelint stylelint-processor-styled-components stylelint-config-styled-components stylelint-config-recommended stylelint-config-standard jsonlint'}
" Plug 'davidhalter/jedi-vim'
"
" Plug 'fatih/vim-go' { 'do': ':GoInstallBinaries' }clojure
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"
" Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/echodoc.vim'
" Plug 'zchee/deoplete-jedi'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" Plug 'tomtom/tcomment_vim'
" Plug 'mattn/emmet-vim'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'jiangmiao/auto-pairs' " zarojel kezeleshez l. meg ezt: https://stackoverflow.com/questions/4521818/automatically-insert-a-matching-brace-in-vim
"
" " https://github.com/ncm2/ncm2 " -- ez is ilyen kiegeszitgetos cucc, mint a deoplete
" Plug 'neomake/neomake'
" Plug 'NLKNguyen/papercolor-theme'
call plug#end()



""" search
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
set ignorecase
set smartcase


""" tab, indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround


""" no backup
set nobackup
set nowritebackup
set noswapfile


""" wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/**/*,*/.svn/**/*,*.tar.*
set wildcharm=<Tab>
set wildignorecase


""" misc
set mouse=a
set scrolloff=3
set sidescrolloff=5
set wrap
set number
set hidden
set cursorline
set colorcolumn=80
set clipboard+=unnamedplus

"""LaTeX
" a .tex fajlokat latex-nek gondolja, ne plaintex-nek:
let g:tex_flavor = 'latex'



""" colorscheme, background
colorscheme default
set background=dark
" set termguicolors
" set background=light


""" PLUGINS

" lightline
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }




" " ALE
" " Only run linters named in ale_linters settings.
" " let g:ale_linters_explicit = 1
" " let g:ale_fix_on_save = 1
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {
    " \   'css': ['stylelint'],
    " \   'scss': ['stylelint'],
    " \   'sass': [],
    " \   'less': ['stylelint'],
    " \   'javascript': ['standard'],
    " \   'json': ['jsonlint'],
    " \   'markdown': ['markdownlint'],
    " \   'python': ['pylint', 'flake8'],
    " \   'sh': ['shellcheck'],
    " \   'tex': ['lacheck'],
    " \   'vim': ['vint'],
    " \   'xml': ['xmllint'],
    " \   'yaml': ['yamllint'],
" \}
" let g:ale_fixers = {
    " \   'css': ['stylelint'],
    " \   'scss': ['stylelint'],
    " \   'sass': [],
    " \   'less': ['stylelint'],
    " \   'go': ['gofmt', 'goimports'],
    " \   'html': ['tidy'],
    " \   'javascript': ['standard'],
    " \   'python': ['yapf'],
    " \   'xml': ['xmllint'],
    " \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}

" " DEOPLETE
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#show_docstring = 0
" " let g:deoplete#sources#jedi#enable_typeinfo = 0
" " let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#sources#jedi#enable_typeinfo = 1
" " set splitright
" " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" set completeopt-=preview

" " ECHODOC
" " set cmdheight=2
" set noshowmode
" " TODO: ha lesz lightline, akkor ezek nem kellenek

" " TERN
" " let g:deoplete#sources#ternjs#timeout = 1
" let g:deoplete#sources#ternjs#types = 1
" let g:deoplete#sources#ternjs#docs = 1
" let g:deoplete#sources#ternjs#case_insensitive = 1
" let g:deoplete#sources#ternjs#filetypes = [
                " \ 'jsx',
                " \ 'javascript.jsx',
                " \ 'vue',
                " \ ]



""" F U N C T I O N S
function! BackgroundToggle()
    if (&background ==? "light")
        set background=dark
    else
        set background=light
    endif
endfunction


""" M A P P I N G
let g:inform="INFO -- NVIM\n
\\n
\<F2>   :terminal\n
\<F3>   :make\n
\<F4>   :Fix syntax\n
\\n
\<F5>   :syntaxcheck toggle\n
\<F6>   :GitGutterToggle\n
\<F7>   :BackgroundToggle\n
\<F8>   :list!\n
\\n
\\\b     :buffer\n
\\\ps    :PlugStatus\n
\\\pi    :PlugInstall\n
\\\pu    :PlugUpdate\n
\\\pp    :PlugUpgrade\n
\\\pc    :PlugClean\n
\\\sn    :Syntax: next error\n
\\\sp    :Syntax: previous error\n
\"
" shell: F2
noremap <F2> :te<CR>A
" make: F3
noremap <F3> :make 
" Fix syntactic
noremap <F4> :ALEFix<CR>
" TODO: next/prev error

" paste syntax check: F5
noremap <F5> :ALEToggle<CR>
" gitgutter toggle: F6
nnoremap <F6> :GitGutterToggle<CR>
" change background and colorscheme
noremap <F7> :call BackgroundToggle()<CR>
" toggle list
noremap <F8> :set list!<CR>
" show information
noremap <F12> :echo inform<CR>

" buffers: \b, Alt + Arrows
" nnoremap <M-Right> :bn<Enter>
" nnoremap <M-Left> :bp<Enter>
nnoremap <Leader>b :buffer <Tab><Tab>
" nnoremap <Leader>sn :ALENextWrap<CR>
" nnoremap <Leader>sp :ALEPreviousWrap<CR>

" show status of plugins
nnoremap <Leader>ps :PlugStatus<CR>
" install plugins
nnoremap <Leader>pi :PlugInstall<CR>
" update plugins
nnoremap <Leader>pu :PlugUpdate<CR>
" update vim-plug
nnoremap <Leader>pp :PlugUpgrade<CR>
" clean plugins
nnoremap <Leader>pc :PlugClean<CR>

" """ bash (emacs) like shortcuts in commandline-mode
" " Move start of the line
" cnoremap <C-a>  <Home>
" " Move end of the line
" cnoremap <C-e>  <End>
" " Move one word left
" cnoremap <M-b>  <S-Left>
" " Move one word right
" cnoremap <M-f>  <S-Right>
" " Delete one word left: Ctrl+W, this is the default
" " cnoremap <C-w>  <S-left><Delete>
" " Delete one word right
" cnoremap <M-d>  <S-right><Delete>
" " " omnicomplete: Ctrl+Space
" " inoremap <NUL> <C-x><C-o>
