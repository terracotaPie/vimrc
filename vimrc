"Minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('junegunn/goyo.vim')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('vim-airline/vim-airline')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('tpope/vim-sensible')
call minpac#add('dracula/vim')
call minpac#add('Chiel92/vim-autoformat')
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('tpope/vim-surround')
call minpac#add('reedes/vim-pencil')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('reedes/vim-lexical')
call minpac#add('morhetz/gruvbox')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('Shougo/denite.nvim')
call minpac#add('Glench/Vim-Jinja2-Syntax')
call minpac#add('j5shi/taglist.vim')
call minpac#add('w0rp/ale')
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('zchee/deoplete-jedi')
call minpac#add('Yggdroot/indentLine')
call minpac#add('lervag/vimtex')
"end


syntax on
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set listchars=tab:>·,trail:~,extends:>,precedes:<
set hlsearch

"Keybindings
let mapleader=","
"Eye candy
colorscheme dracula
set termguicolors

"Airline
let g:airline_powerline_fonts = 0
let g:airline_theme = "dracula"
set noshowmode

let g:ale_linters = {
			\   'python': ['flake8'],
			\   'c': ['gcc']
			\}
let g:ale_c_gcc_options = "-std=c11 -Wall -Wextra -std=gnu99 -pthread -lrt"


"C
"au BufWrite *.py *.c *.h :Autoformat
let Tlist_Close_On_Select = 1


"Markdown
let g:vim_markdown_folding_disabled = 1
"augroup lexical
"autocmd!
"autocmd FileType markdown,mkd,tex,textile call lexical#init()
"\ | call pencil#init()
"autocmd FileType text call lexical#init({ 'spell': 0 })
"augroup END

"macvim
if has('gui_running')
	set guifont=mononoki-Regular\ Nerd\ Font\ Complete:h14
endif

" Latex settings
" Disable polyglot to avoid conflicts with vimtex
let g:polyglot_disabled = ['latex', 'tex']

"python
let g:python2_host_prog = '/usr/local/bin/python2'

"keymappings
" basic
nmap ; :

"Plugins
nnoremap <silent> <c-g> :TlistOpen<CR>
nnoremap <silent> <c-p> :Denite file_rec<CR>
nnoremap <silent> <c-b> :Denite buffer<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

packloadall
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

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
let g:vimtex_compiler_progname = "nvr"
