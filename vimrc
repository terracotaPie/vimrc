syntax on
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set listchars=tab:>·,trail:~,extends:>,precedes:<

"Keybindings
let mapleader=","
"Eye candy
colorscheme dracula

"Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

"Airline
let g:airline_powerline_fonts = 1

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
