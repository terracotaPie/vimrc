"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/timurborkhodoev/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/timurborkhodoev/.cache/dein')
    call dein#begin('/Users/timurborkhodoev/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/timurborkhodoev/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('junegunn/goyo.vim')
    call dein#add('majutsushi/tagbar')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('tpope/vim-sensible')
    call dein#add('dracula/vim')
    call dein#add('tpope/vim-surround')
    call dein#add('reedes/vim-pencil')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('reedes/vim-lexical')
    call dein#add('morhetz/gruvbox')
    call dein#add('tpope/vim-rhubarb')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Glench/Vim-Jinja2-Syntax')
    call dein#add('j5shi/taglist.vim')
    call dein#add('w0rp/ale')
    call dein#add('itchyny/lightline.vim')
    call dein#add('maximbaz/lightline-ale')
    call dein#add('sbdchd/neoformat')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('Galooshi/vim-import-js')
    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('tpope/vim-repeat')
    call dein#add('pangloss/vim-javascript')
    call dein#add('mxw/vim-jsx')
    call dein#add('pelodelfuego/vim-swoop')
    " themes
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('lifepillar/vim-solarized8')
    call dein#add('nanotech/jellybeans.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set visualbell
nmap ; :
vmap ; :
let mapleader=","
let maplocalleader = ","
set relativenumber
set number
set cursorline
" turn off gutentags while commiting
au FileType gitcommit,gitrebase let g:gutentags_enabled=0


" Persistent undo files
let vimDir = '$HOME/.vim'
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

"EyeCandy
colorscheme solarized8_dark_flat
set termguicolors

set noshowmode

let g:PaperColor_Theme_Options = {
    \   'theme': {
    \     'default.dark': {
    \       'transparent_background': 1
    \     }
    \   }
    \ }

"Denite
map <C-P> :DeniteProjectDir -buffer-name=git -direction=top file_rec/git<CR>
nnoremap <silent> <c-b> :Denite buffer<CR>

" denite content search
map <leader>a :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>

call denite#custom#source(
    \ 'grep', 'matchers', ['matcher_regexp'])

" use ag for content search
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep', '--ignore-dir', '__tests__', '-C'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" -u flag to unrestrict (see ag docs)
call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#map(
    \ 'insert',
    \ '<C-j>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-k>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)

"HARDCORE
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

nnoremap <pageup> <nop>
nnoremap <pagedown> <nop>
nnoremap <home> <nop>
nnoremap <end> <nop>

nnoremap <backspace> <nop>
nnoremap <tab> <nop>

nnoremap <del> <nop>

" neoformat
noremap <C-l> :Neoformat eslint_d<CR>

let g:lightline = {
  \ 'colorscheme': 'solarized'
\}

let g:lightline.component_function = {
      \   'gutentags': 'LightlineGutentags',
      \   'gitbranch': 'LightlineGitBranch',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

" lightline
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'absolutepath', 'modified' ],
    \           [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \           [ 'gitbranch' ]],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'gutentags' ],
    \          ]
    \ }
let g:lightline.inactive = {
    \ 'left': [ [ 'absolutepath' ], [ 'gitbranch' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

function! LightlineGutentags() abort
  return exists('b:gutentags_files') ? gutentags#statusline() : ''
endfunction

function! LightlineGitBranch() abort
    return FugitiveStatusline()
endfunction

let g:deoplete#enable_at_startup = 1

" vim swoop
nmap <Leader>l :call Swoop()<CR>
