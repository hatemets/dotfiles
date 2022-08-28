""
"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
let mapleader = " "

call plug#begin()
Plug 'glepnir/dashboard-nvim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'preservim/NERDTree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'LunarVim/onedarker.nvim'
Plug 'simeji/winresizer'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'puremourning/vimspector'
Plug 'SirVer/ultisnips'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kana/vim-arpeggio'
Plug 'folke/which-key.nvim'
Plug 'itchyny/lightline.vim'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

" Debugging
" config file destination
let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
let g:vimspector_install_gadgets = ['vscode-node-debug2']

" [L]aunch
nnoremap <tab>l :call vimspector#Launch()<CR>

" [Q]uit
nnoremap <tab>q :call vimspector#Reset()<CR>

" [R]un
nnoremap <tab>r :call vimspector#Continue()<CR>

" r[E]start
nnoremap <tab>e :call vimspector#Restart()<CR>

" [T]oggle breakpoints
nnoremap <tab>t :call vimspector#ToggleBreakpoint()<CR>

" [D]elete breakpoints
nnoremap <tab>d :call vimspector#ClearBreakpoints()<CR>

" [O]ut
nnoremap <tab>o :call vimspector#StepOut()<CR>

" step [I]nto
nnoremap <tab>i :call vimspector#StepInto()<CR>

" step o[V]er
nnoremap <tab>v :call vimspector#StepOver()<CR>

" [S]top debugging
nnoremap <tab>s :call vimspector#Stop()<CR>

" [P]ause debugging
nnoremap <tab>p :call vimspector#Pause()<CR>

" display [B]reakpoints
nnoremap <tab>b :call vimspector#ListBreakpoints()<CR>

" Advanced mappings
" | modes | option (b(uffer), e(xpr), s(ilent), u(nique)) | action remap? | triggers | action |
" call arpeggio#map('n', '', 0, '<A-;>', 'dd')
" call arpeggio#map('n', '', 0, '<leader>h', '<C-w>h')

" Dashboard
let g:dashboard_default_executive = 'fzf'

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" nnoremap <tab>g :call ToggleConsole()<CR>

" Autocommands
autocmd BufWinLeave *.* mkview!

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
set backspace=indent,eol,start



nnoremap <tab>j 20j
nnoremap <tab>k 20k
nnoremap <tab>h 20h
nnoremap <tab>l 20l


"" Change NERDTree root with cd
" augroup DIRCHANGE
"     au!
"     autocmd DirChanged global :NERDTreeCWD
" augroup END

" nnoremap <tab>z !terminator<enter>
" nnoremap <tab>z :!terminator<cr><cr>
" nnoremap <tab>z echo ho

" function! NeovideClosure() abort
"     execute('!terminator')
"     call timer_start(10, { param -> execute('q')})
" endfunction

function! LoadView() abort
    try
        loadview
    catch /.*/
        return
    endtry
endfunction

autocmd BufWinEnter * call LoadView()

" Rename
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <C-n> o<Esc>

" Multi-line comments
nnoremap gc; 0i/* <Esc>A */<Esc>0
nnoremap gc' 0v2ld$v2hd0

" C++
" noremap <leader>w :!g++ -std=c++20 % -o out<Enter>
" noremap <leader>e :!./out<Enter>

" Humanized typenames in C++
" map <leader>e :!./out \| c++filt -t<Enter>

" General keybindings
inoremap <C-k> <C-p>
inoremap <C-j> <C-n>
inoremap <C-space> <C-y>
inoremap <tab><enter> <esc>
vnoremap <tab><enter> <esc>
" map <leader>s <Plug>(Prettier):wa<Enter>
noremap <leader>s :wa<CR>
noremap <leader>h <C-w>h
noremap <leader>l <C-w>l
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>n <C-w>n<C-w>k
noremap <leader>a :NERDTreeToggle<Enter>
noremap <leader>q :q<Enter>
noremap <leader>v <C-w>v<C-w>l
noremap <leader>` :CocCommand snippets.editSnippets<Enter>
noremap <C-f> zz
noremap <leader>/ :noh<Enter>
nmap <tab>; gcc
vmap <tab>; gc

" Scrollig
noremap <C-j> <C-e>
noremap <C-k> <C-y>

" Plugin keybindings
noremap <leader>f :BLines<Enter>
" map <leader>r :Rg<Enter>
noremap <leader>+ :PlugInstall<Enter>
noremap <leader>- :PlugClean<Enter>
noremap <leader>p :Files<enter>


autocmd BufRead,BufNewFile *.scala set shiftwidth=4

" Prettier settings
let g:prettier#config#print_width = '100'

let g:coc_global_extensions = ['coc-clangd', 'coc-python', 'coc-eslint', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-pairs', 'coc-emmet']

colorscheme vim-monokai-tasty
syntax on
let g:user_emmet_leader_key='<Tab>'
set number
set nowrap
set textwidth=0
set formatoptions=tcqrn1
set formatoptions-=cro

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
" set autoindent
filetype plugin indent on

set updatetime=300
set rnu
set matchpairs+=<:> " use % to jump between pairs
set laststatus=2
set title
set mouse=a

" Folding
nnoremap <leader>y 0Vf{%zf

set foldmethod=manual
" set foldlevel=2
" set foldclose=all
" set nofoldenable
nnoremap / /\v
vnoremap / /\v
set background=dark
set scrolloff=5
let g:closetag_filenames = "*.html, *.xhtml, *.phtml"
let g:closetag_filenames = "*.js, *.xhtml"
let g:closetag_shortcut = ">"
let g:closetag_close_shortcut = "<leader>>"
set clipboard+=unnamedplus
set foldcolumn=0
set signcolumn=no
set cinkeys-=:
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" --- Coc-related configurations ---
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Jump to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction 

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add new line between brackets after pressing enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
            \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:python_highlight_space_errors = 0

" Window resizer
let g:winresizer_start_key = "<M-;>"

" Latex
" \ll - toggle compilation
" \lk - stop
" \lc - clear auxiliary files
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexrun'
let g:tex_flavor = 'latex'
let maplocalleader = ","

" ultisnips
" let g:UltiSnipsSnippetsDir = "$HOME/.config/nvim/plugged/ultisnips/snippets/"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nmap <tab>/  <Plug>(coc-codelens-action)

" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :bw<CR>
nnoremap <C-l> gt<CR>k
nnoremap <C-h> gT<CR>k


set showtabline=2
set noshowmode

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" Neovide settings
" let g:neovide_cursor_vfx_mode = "torpedo"
" let g:neovide_cursor_trail_length=0.01
" nnoremap <tab>c :terminal ls % && bash<cr>i<cr><C-l>
" let g:jsx_ext_required = 0 set guifont=Source\ Code\ Pro:h14

" Javascript/Typescript

" NERDTree
let g:DevIconsEnableFoldersOpenClose = 1

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A


" Alt keymappings
nnoremap <M-d> dd
