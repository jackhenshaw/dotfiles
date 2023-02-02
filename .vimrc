" General formatting {{{
" - Tabs and autoindentation
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" - Absolute line number with relative line numbers surrounding
set nu rnu
" - Searching words
set nohlsearch
set incsearch
" - Stop text wrapping
set nowrap
" - Relating to history/backups
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" - Remove duplicated statusbar messages
set noshowmode
" - Start scrolling page earlier than bottom of page
set scrolloff=8
" - Remove error sound
set noerrorbells
" - Relating to columns
set colorcolumn=80
if v:version >= 800
  set signcolumn=yes
endif
" - Set spellcheck language
set spelllang=en_gb
" }}}
" Plugins {{{
" Install vim-plugged using the command below
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'                                  " colorscheme
Plug 'vim-airline/vim-airline'                                    " bottom status bar
Plug 'vim-airline/vim-airline-themes'                             " bottom status bar themes
Plug 'preservim/nerdtree'                                         " file explorer
Plug 'airblade/vim-gitgutter'                                     " git in sidebar
Plug 'luochen1990/rainbow'                                        " rainbow brackets to help in nested loops
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck' " quickfix list for spelling mistakes
Plug 'wakatime/vim-wakatime'                                      " Measures how long I spend coding
Plug 'junegunn/goyo.vim'                                          " clears all visual clutter
Plug 'junegunn/limelight.vim'                                     " highlights only current paragraph
if v:version >= 800
  Plug 'sirver/ultisnips'                                         " shortcuts for code snippets
  Plug 'ycm-core/YouCompleteMe'                                   " vim autocomplete
endif
call plug#end()
" }}}
" Configuring vim plugins {{{
"   - Change colorscheme by default
let &t_ut=''
set bg=dark
colorscheme gruvbox
"   - airline status bar
let g:airline#extensions#tabline#enabled = 1
"   - Add rainbow brackets
let g:rainbow_active = 1
"   - Ultisnips
if has('siver/UltiSnips')
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsSnippetDirectories=['UltiSnips','~/.vim/snippets.vim']
endif
"   - Writing mode
" Writing configuration
command WriteMode set tw=150 | set fo+=t | set wrap | Goyo 150 | echo "Write mode enabled."
command WriteModeDisable set fo-=t | set nowrap | Goyo | echo "Write mode disabled."
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}
" Keyboard mappings {{{
" - navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" - Toggle NERDTree file viewer
map <C-f> :NERDTreeToggle<CR>

" - Toggle spell check
map <F1> :setlocal spell!<CR>
" - Map turning highlighting of words on and off
map <F4> :set hlsearch! hlsearch?<CR>

" - Enable and disable writing mode
map <F5> :WriteMode <CR>
map <esc> :WriteModeDisable <CR>

" }}}
" Custom functions {{{
" - automatically trim trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
augroup trimWhiteSpace
  autocmd!
  autocmd BufWritePre * : call TrimWhitespace()
augroup END
" - Build cmake inside vim (Used in compiling my PhD thesis quickly)
:command Make make
" - remember folds (useful for when writing thesis, less good for vim sessions
augroup remember_folds
  autocmd!
  au BufWinLeave ?* silent! mkview
  au BufWinEnter ?* silent! loadview
augroup END
" }}}

" Set this file to close all vim folds by default
" vim:foldmethod=marker:foldlevel=0

if (has("termguicolors"))
  set termguicolors
endif
