
set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256 
" set foldmethod = syntax

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")
Plugin 'Shougo/deol.nvim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-commentary'
Plugin 'ap/vim-css-color'
Plugin 'dense-analysis/ale'
Plugin 'arzg/vim-colors-xcode'
Plugin 'tpope/vim-repeat'
Plugin 'frazrepo/vim-rainbow'
Plugin 'Yggdroot/indentLine'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'relastle/bluewery.vim'
Plugin 'morhetz/gruvbox'
Plugin 'arzg/vim-corvine'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
"
"Plugin 'junegunn/fzf.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'sillybun/vim-repl'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'megantiu/true.vim'
Plugin 'vimwiki/vimwiki'
call vundle#end()            " required

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wadackel/vim-dogrun'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'dylanaraps/wal.vim'
call plug#end() 

"" VimTmuxRunner mappings
nmap <leader>pa :VtrAttachToPane <CR>
vmap <leader>ps :VtrSendLinesToRunner <CR>

let $FZF_DEFAULT_COMMAND = "find -L"
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
let g:indentLine_conceallevel = 2
let g:indentLine_setColors = 0
let g:rainbow_active = 1
let g:repl_program = { 'javascript':'node'}
let g:repl_exit_commands = { 'node':'.exit'}
let g:mapleader=" "

let g:coc_global_extensions = [
	\ 'coc-tsserver' ]

nnoremap <leader>r :REPLToggle<Cr>

" nnoremap <leader>p :Pretter<Cr>
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

"sets tab to autocomplete in Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set ts=3
set mouse=a
"hide tool bar and menu bar
set guioptions-=T
set guioptions-=m
" remove scroll bar
set guioptions-=r

highlight clear SignColumn
highlight clear LineNr
let g:gruvbox_invert_selection = 0
let g:gruvbox_number_column = 'bg'
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'medium'
colorscheme base16-gruvbox-dark-pale
set background=dark
let g:airline_theme='minimalist'

syntax enable
set encoding=utf-8
set number relativenumber
set autoindent
set wildmode=longest,list,full

set splitbelow splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>

"----- MACROS-----"
let @a ='ysstalli href='
let @u ='ostul€ku€kr€kr€kr€kr	stli'
"----" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  :FZF<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>-------------"
runtime macros/matchit.vim

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod = syntax
augroup END
