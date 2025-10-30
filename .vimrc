call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

let mapleader = " "
nnoremap <leader>n :Explore<CR>
nnoremap <leader>h :nohlsearch<CR>
set number
set relativenumber
nnoremap y "+y
nnoremap Y "+Y
syntax on

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_virtual_text_enabled = 1

au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': ['clangd'],
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
    \ })
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <leader>rn :LspRename<CR>
nnoremap <silent> <Leader>ca :LspCodeAction<CR>

let g:asyncomplete_auto_popup = 1
set completeopt=menuone,noinsert,noselect
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :Rg<CR>
let g:airline#extensions#tabline#enabled = 1
set showtabline=2
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set guifont=MononokiNerdFont
set statusline=%f\ %y\ %m%r%=%-14.(%l,%c%V%)\ %P
let g:airline_disable_statusline = 1

function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()
