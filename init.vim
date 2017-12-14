" Plugin Management
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
call minpac#add('lervag/vimtex')
call minpac#add('easymotion/vim-easymotion')
"end

" Managing tabs and spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set hlsearch
set visualbell

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
