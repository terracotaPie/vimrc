packloadall
" Deoplete settings
let g:deoplete#enable_at_startup = 0
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
let g:vimtex_compiler_progname = "nvr"
" Latex settings
" Disable polyglot to avoid conflicts with vimtex
let g:polyglot_disabled = ['latex', 'tex', 'python-ident']

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
			\   'latex': ['proselint'],
			\		'rust': ['rls']
			\}
let g:ale_c_gcc_options = "-std=c11 -Wall -Wextra -std=gnu99 -pthread -lrt"

"C
let Tlist_Close_On_Select = 1

" Orgmode
"
let g:org_indent = 1
let g:org_agenda_files = ['~/Development/agenda/*.org']

" Thesaurus
nnoremap zk :OnlineThesaurusCurrentWord<CR>
