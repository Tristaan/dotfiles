"T Vim config
set shell=$SHELL
if has("nvim")
    set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
    set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
  set termguicolors
endif
set encoding=utf-8
set t_Co=256
set t_ut=

"Timeout for <esc> and <leader>
set ttimeoutlen=1000
set timeoutlen=800

set hidden "Multiple buffers
set laststatus=2 "Always show status lines
set number numberwidth=2 " Show line number column
set relativenumber " Show numbers relative to current position
set cursorline
set autoindent "Automatic indentation of files
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab "Tab Settings
set nosol
set showcmd "Show command in status bar
set showmatch "Show matching brackets
set noshowmode
set noswapfile
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

if has("mouse")
  set mouse=a
endif
set mousehide           " Hide mouse pointer on insert mode."

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Interfaces
Plugin 'Shougo/unite.vim'
Plugin 'mhinz/vim-startify'

"Utilities
Plugin 'Shougo/vimfiler.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'moll/vim-bbye'
Plugin 'stevearc/vim-arduino'
Plugin 'Shougo/deoplete.nvim'
Plugin 'fishbullet/deoplete-ruby'
Plugin 'Shougo/deoplete-rct'
"GIT
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"Ruby and rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'

" EMMET - HTML autocompletions
Plugin 'mattn/emmet-vim'

"syntax, colorscheme, etc. (visuals)
Plugin 'itchyny/lightline.vim'
Plugin 'taohex/lightline-buffer'
Plugin 'ryanoasis/vim-devicons'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'vim-scripts/octave.vim--'
Plugin 'sheerun/vim-polyglot'
Plugin 'tristaan/vim-smooth'
Plugin 'vivien/vim-linux-coding-style'
call vundle#end()

"SYNTAX COLORING AND COMPLETION
filetype plugin indent on
syntax enable
colorscheme smooth
set omnifunc=syntaxcomplete#Complete

"VIMFILER
let g:vimfiler_as_default_explorer = 1

"EMMET
let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key = '<C-e>'
let g:deoplete#enable_at_startup = 1
"ARDUINO
let g:arduino_dir = '/usr/share/arduino'
"STARTIFY
let g:startify_list_order = [
            \ ['   Most recently used in directory:'],
            \ 'dir',
            \ ['   Most recently used files:'],
            \ 'files',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Commands:'],
            \ 'commands',
        \ ]
let g:startify_files_number = 6
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_sort = 0
let g:startify_custom_header = [
    \ "    .----------------.  .----------------.  .----------------.  .----------------.  ",
    \ "    | .--------------. || .--------------. || .--------------. || .--------------. |",
    \ "    | | ____   ____  | || |     _____    | || | ____    ____ | || |     ____     | |",
    \ "    | ||_  _| |_  _| | || |    |_   _|   | || ||_   \\  /   _|| || |   .' __ '.   | |",
    \ "    | |  \\ \\   / /   | || |      | |     | || |  |   \\/   |  | || |   | (__) |   | |",
    \ "    | |   \\ \\ / /    | || |      | |     | || |  | |\\  /| |  | || |   .`____'.   | |",
    \ "    | |    \\ ' /     | || |     _| |_    | || | _| |_\\/_| |_ | || |  | (____) |  | |",
    \ "    | |     \\_/      | || |    |_____|   | || ||_____||_____|| || |  `.______.'  | |",
    \ "    | |              | || |              | || |              | || |              | |",
    \ "    | '--------------' || '--------------' || '--------------' || '--------------' |",
    \ "     '----------------'  '----------------'  '----------------'  '----------------' ",
    \ ]
"LIGHTLINE
let g:lightline = {
            \ 'tabline': {
            \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
            \ 'right': [ [ 'close' ], ],
            \ },
            \ 'component_expand': {
            \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
            \ },
            \ 'component_type': {
            \ 'buffercurrent': 'tabsel',
            \ },
            \ 'mode_map': { 'c': 'NORMAL' },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \ 'bufferbefore': 'lightline#buffer#bufferbefore',
            \ 'bufferafter': 'lightline#buffer#bufferafter',
            \ 'bufferinfo': 'lightline#buffer#bufferinfo',
            \ 'modified': 'LightlineModified',
            \ 'readonly': 'LightlineReadonly',
            \ 'fugitive': 'LightlineFugitive',
            \ 'filename': 'LightlineFilename',
            \ 'fileformat': 'LightlineFileformat',
            \ 'filetype': 'LightlineFiletype',
            \ 'fileencoding': 'LightlineFileencoding',
            \ 'mode': 'LightlineMode',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
"Bufferline settings
set showtabline=2
let g:lightline_buffer_logo = ''
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20


function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"MAPPINGS
set pastetoggle=<F2>
let mapleader=" "
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap <F5> :Denite buffer<CR>
nnoremap <F6> :Startify<CR>
"noremap j    h
"noremap k    j
"noremap l    k
"noremap č    l
"Mappings to reduce keypresses
nnoremap \ <C-w>

imap jk    <esc>
imap <tab><tab> <c-x><c-o>

nnoremap <leader>f :<C-u>:VimFilerExplorer<CR>
nnoremap <leader>l  :bnext<CR>
nnoremap <leader>h  :bprevious<CR>
nnoremap <leader>c  :Bdelete<CR>
nnoremap <leader>r  :make<CR>
nnoremap <leader>ad  :ArduinoUploadAndSerial<CR>
nnoremap <leader>as  :ArduinoSerial<CR>
nnoremap <leader>ab  :ArduinoChooseBoard<CR>
nnoremap <leader>ap  :ArduinoChoosePort<CR>

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <leader>gp     <Plug>GitGutterPreviewHunk
nnoremap <leader>gr     <Plug>GitGutterUndoHunk:echomsg ' hr is deprecated. Use  hu'<CR>
nnoremap <leader>gu     <Plug>GitGutterUndoHunk
nnoremap <leader>gs     <Plug>GitGutterStageHunk

"OMNICOMPLETE
"FUNCTIONS
function! PythonInit()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set fileformat=unix
endfunction

"AUTOCOMMANDS
augroup helpfiles
    au!
    au BufRead,BufEnter */doc/* wincmd L
augroup END

augroup filetypes
    au!
    au FileType eruby let b:surround_45 = "<%= \r %>"
    au FileType html,css,eruby EmmetInstall
augroup END

augroup newfiles
    au!
    au BufWritePre * %s/\s\+$//e
    au! BufRead,BufNewFile *.m,*.oct set filetype=octave
    au BufNewFile,BufRead *.py call PythonInit()
augroup END
