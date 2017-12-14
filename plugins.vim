packloadall
" Deoplete settings
if exists('g:deoplete')
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
	if !exists('g:deoplete#omni#input_patterns')
		let g:deoplete#omni#input_patterns = {}
	endif
	let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
endif
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ deoplete#mappings#manual_complete()
let g:vimtex_compiler_progname = "nvr"
" Latex settings
" Disable polyglot to avoid conflicts with vimtex
let g:polyglot_disabled = ['latex', 'tex']

" Python
let g:python2_host_prog = '/usr/local/bin/python2'

" Markdown
let g:vim_markdown_folding_disabled = 1
augroup lexical
autocmd FileType markdown,mkd,tex,textile call lexical#init()
\ | :SoftPencil
augroup END

" Linting
let g:ale_linters = {
			\   'python': ['flake8'],
			\   'c': ['gcc'],
			\   'latex': ['proselint']
			\}
let g:ale_c_gcc_options = "-std=c11 -Wall -Wextra -std=gnu99 -pthread -lrt"

"C
let Tlist_Close_On_Select = 1

