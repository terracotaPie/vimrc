" Default extensions
nmap ; :
vmap ; :
" Plugins' extensions
nnoremap <silent> <c-g> :TlistOpen<CR>
nnoremap <silent> <c-p> :Denite file_rec<CR>
nnoremap <silent> <c-b> :Denite buffer<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <Leader> <Plug>(easymotion-prefix)

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

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ deoplete#mappings#manual_complete()
