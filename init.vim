set number
filetype on                  " required

call plug#begin('~/.config/nvim/plugged')

 Plug 'scrooloose/nerdtree'
 Plug 'scrooloose/nerdcommenter'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'tpope/vim-haml'
 " Fancy UI
 Plug 'vim-airline/vim-airline'
 Plug 'morhetz/gruvbox'
 Plug 'ryanoasis/vim-devicons'
 "-----------------------------------
 "Git
 Plug 'tpope/vim-fugitive'
 Plug 'junegunn/gv.vim'

 "-----------------------------------
 Plug 'tpope/vim-endwise'

 " Autocomplete
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'autozimu/LanguageClient-neovim' ,  {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 Plug 'reasonml-editor/vim-reason-plus'
 Plug 'wokalski/autocomplete-flow'
 Plug 'terryma/vim-multiple-cursors'
 "Snippet
 Plug 'Shougo/neosnippet.vim'
 Plug 'Shougo/neosnippet-snippets'
 Plug 'jiangmiao/auto-pairs'

 " JavaScript {{{4
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'

 " Ruby {{{4
 Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
 Plug 'tpope/vim-rails'

 "Go
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

 call plug#end()

filetype plugin indent on    " required

 "----------------------------------------------------------
 "General settings
 "----------------------------------------------------------
 set termguicolors
 colorscheme gruvbox
 set background=dark                      " Setting dark mode

 if has('unnamedplus')
         set clipboard=unnamed,unnamedplus
 endif
 let g:gruvbox_contrast_dark = 'hard'
 let g:gruvbox_hls_cursor = 'yellow'
 syntax enable
 scriptencoding utf-8
 set mouse=a                              "highlight the current line for the cursor
 set cursorline
 set list                          " show trailing whitespace
 set listchars=tab:\|\ ,trail:▫

 "Indention
 set tabstop=2     "tabs are at proper location
 set expandtab     "don't use actual tab character (ctrl-v)
 set shiftwidth=2  "indenting is 2 spaces
 set autoindent    "turns it on
 set smartindent   "does the right thing (mostly) in programs
 set softtabstop=2
 set smarttab

 "Vim airline
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'
 let g:airline#extensions#tabline#formatter = 'unique_tail'
 let g:airline#extensions#ale#enabled = 1

 if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
 endif

 map <Leader>nt :NERDTreeToggle<CR>
 map <Leader>nr :NERDTreeFind<CR>

 map ; :Files<CR>

 "===============================

 "Split navigations
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 "================================

 "Switch tabs
 nnoremap H gT
 nnoremap L gt
 nnoremap tn :tabnew<CR>

 "ale
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'ruby': ['rubocop'],
 \   'go': ['gopls'],
 \}
 set completeopt+=noinsert
 set completeopt+=preview
 set completeopt+=menuone

 let g:ale_completion_enabled = 1
 let g:ale_completion_maix_suggestions = 50
 let g:ale_fixers = {}
 let g:ale_fixers['javascript'] = ['prettier']
 let g:ale_fixers['re'] = ['prettier']
 let g:ale_ruby_rubocop_options = ' --only Style/StringLiterals'
 let g:ale_sign_error = '●' " Less aggressive than the default '>>'
 let g:ale_sign_warning = '⚠'
 let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
 let g:ale_lint_on_text_changed = 1
 nmap <leader>d <Plug>(ale_fix)


 "deoplete
 " Disable deoplete when in multi cursor mode
 function! Multiple_cursors_before()
  'go': ['gopls']
 endfunction
 set completeopt+=noinsert
 set completeopt+=preview
 set completeopt+=menuone

 let g:ale_completion_enabled = 1
 let g:ale_completion_maix_suggestions = 50
 let g:ale_fixers = {}
 "Switch tabs
 nnoremap H gT
 nnoremap L gt
 nnoremap tn :tabnew<CR>

 "ale

 "===============================

 "Split navigations
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 "================================

 "Switch tabs
 nnoremap H gT
 nnoremap L gt
 nnoremap tn :tabnew<CR>

 "ale
 let g:ale_linters = {
 \   'javascript': ['eslint'],
 \   'ruby': ['rubocop'],
 \   'go': ['gopls'],
 \}
 set completeopt+=noinsert
 set completeopt+=preview
 set completeopt+=menuone

 let g:ale_completion_enabled = 1
 let g:ale_completion_maix_suggestions = 50
 let g:ale_fixers = {}
 let g:ale_fixers['javascript'] = ['prettier']
 let g:ale_fixers['re'] = ['prettier']
 let g:ale_ruby_rubocop_options = ' --only Style/StringLiterals'
 let g:ale_sign_error = '●' " Less aggressive than the default '>>'
 let g:ale_sign_warning = '⚠'
 let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
 let g:ale_lint_on_text_changed = 1
 nmap <leader>d <Plug>(ale_fix)


 "deoplete
 " Disable deoplete when in multi cursor mode
 function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
  endfunction
 let g:deoplete#enable_at_startup = 1
 let g:deoplete#enable_smart_case = 1
 let g:deoplete#enable_camel_case = 1
 let g:deoplete#enable_ignore_case = 1

 call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

 let g:LanguageClient_serverCommands = {
     \ 'reason': ['ocaml-language-server', '--stdio'],
     \ 'ocaml': ['ocaml-language-server', '--stdio'],
     \ 'javascript': ['typescript-language-server', '--stdio'],
     \ 'go': ['gopls'],
     \}
" \ 'javascript.jsx': ['/usr/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],

 nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
 nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
 nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

 "autocmd BufEnter  *  call ncm2#enable_for_buffer()
 let g:LanguageClient_autoStart = 1
 autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
 " Run gofmt on save
 autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
 " neosnippet

 let g:neosnippet#enable_completed_snippet = 1
 let g:neosnippet#enable_snipmate_compatibility = 1

 let g:autocomplete_flow#insert_paren_after_function = 1

"---------------------------------------------------

 "go
 let g:go_def_mode='gopls'
 let g:go_info_mode='gopls'
 nmap gr :GoRun<CR>

 "auto import
 let g:go_fmt_command = "goimports"

 "highlight
 let g:go_highlight_build_constraints = 1
 let g:go_highlight_extra_types = 1
 let g:go_highlight_fields = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_methods = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_structs = 1
 let g:go_highlight_types = 1

 "higlight the same variables
 let g:go_auto_sameids = 1

 "Show type information in status line
 let g:go_auto_type_info = 1

 "Go to definition
 au FileType go nmap <F12> <Plug>(go-def)
 "(When I need to get back I press C-t)

 "Go Add Tags
 let g:go_addtags_transform = "snakecase"
 nmap gat :GoAddTags <CR>

 "Go Remove Tags
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>
 nmap <Leader>grm :GoRemoveTag <CR>

"Enable neosnippet in Go
let g:go_snippet_engine = "neosnippet"

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
"----------------------------------------------

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2


"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2


 "----------------------------------------------
 " Plugin: 'terryma/vim-multiple-cursors'
 "----------------------------------------------
 let g:multi_cursor_next_key='<C-n>'
