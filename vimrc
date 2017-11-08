"Minpac
source ~/.vim/packages.vim

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
colorscheme gruvbox
set background=light
hi Normal guibg=NONE ctermbg=none
if has("termguicolors")     " set true colors
	set termguicolors
else
	set t_Co=256
endif

"Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

"Airline
let g:airline_powerline_fonts = 0
let g:airline_theme = "base16_mocha"
set noshowmode

"Zenmode
let g:zenmode_background = "light"
let g:zenmode_colorscheme = "default"

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

"C
au BufWrite * :Autoformat

"Markdown
let g:vim_markdown_folding_disabled = 1
augroup lexical
	autocmd!
	autocmd FileType markdown,mkd,tex,textile call lexical#init()
				\ | call pencil#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

"macvim
if has('gui_running')
	set guifont=mononoki-Regular\ Nerd\ Font\ Complete:h14
endif

"keymappings
nnoremap <c-g> :TlistOpen<CR>
nnoremap <c-p> :Denite file_rec<CR>
nnoremap <c-b> :Denite buffer<CR>

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
