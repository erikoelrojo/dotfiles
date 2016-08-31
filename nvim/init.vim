" General
" ------------------------------------------------------------------------------
execute pathogen#infect()|                              " Pathogen package manager.

syntax on                                               " Enable syntax linting.
filetype plugin on                                      " Enable plugins.
filetype plugin indent on                               " Enable indent by plugin(s).

let g:netrw_liststyle=3                                 " List files with vertical lines.

" Turn these on if using regular vim and not nvim.
if !has('nvim')
    set autoindent                                      " Auto-indentation.
    set backspace=eol,start,indent                      " Enable backspace.
    set hlsearch                                        " Highlight search results.
    set laststatus=2                                    " Always show bottom status bar.
    set mouse=a                                         " Enable mouse.
    set nocompatible                                    " Disable vi compatibility.
    set lazyredraw                                      " Redraw lines only when needed.
    set smarttab                                        " Whitespace/tab stuff.
    set t_Co=256                                        " Use 250 terminal colors.
    set wildmenu                                        " Tab completion.
endif

set autoread                                            " Reads external file updates.
set background=dark                                     " C.f. gruvbox colors.
set clipboard=unnamed                                   " Enable clipboard access.
set cursorline                                          " Show current line.
set expandtab                                           " Set tabs = spaces.
set foldcolumn=1                                        " Whitespace indentation on left margin.
set history=100                                         " History log.
set ignorecase                                          " Ignore casing when searching.
set listchars=tab:>-,nbsp:_,trail:.                     " Make tabs + trailing spaces visible.
set list                                                " ^.
set nofoldenable                                        " Disable line folding.
set rtp+=/usr/local/opt/fzf                             " Set FZF plugin path.
set ruler                                               " Show line+column at bottom right.
set shell=zsh                                           " Shell = zsh.
set shiftwidth=4                                        " Width of indent in spaces.
set showcmd                                             " Show commands as typed.
set smartcase                                           " Specify casing in searching.
set splitbelow                                          " Always split windows below.
set softtabstop=4                                       " Whitespace/tab stuff.
set tabstop=8                                           " Width of tab char in spaces.
set termguicolors                                       " Enable truecolors.
set textwidth=79                                        " Break line after 80 chars.
set undolevels=500                                      " Extent of undo remembers.
set visualbell                                          " No beeping.
set wildmode=list:longest,list                          " Tab completion.

" Automatic Commands
au BufNewFile,BufRead * set formatoptions+=t            " Set textwidth for code but not comments.
au BufNewFile,BufRead .txt set spell spelllang=en_us    " Spell checking for .txt.
au BufNewFile,BufRead .zshrc set textwidth=159          " Double textwidth for zshrc.
au! BufWritePost * Neomake                              " Async run Neomake upon write.

" Aesthetic
" ------------------------------------------------------------------------------
let g:gruvbox_contrast_dark='soft'                      " Set soft colors.
colorscheme gruvbox                                     " A rad colorscheme.

" Highlight color settings (mostly overwritten by colorscheme).
hi CursorLine ctermbg=gray ctermfg=none
hi CursorLineNR ctermbg=gray
hi FoldColumn ctermbg=gray
hi MatchParen ctermbg=none ctermfg=none
hi Normal ctermbg=none ctermfg=none
hi SignColumn ctermbg=none
hi SpellBad ctermbg=Blue ctermfg=black
hi SpellCap ctermbg=none
hi SpellLocal ctermbg=Blue ctermfg=black
hi SpellRare ctermbg=Blue ctermfg=black
hi StatusLine ctermbg=none ctermfg=gray
hi Visual ctermbg=none ctermfg=black

" Functions
" ------------------------------------------------------------------------------
" Toggle line numbers.
function ToggleLines()
    if(&relativenumber == 0)
        set relativenumber!
        set foldcolumn=0
    else
        set relativenumber!
        set foldcolumn=1
    endif
endfunc

" Enable spell linter (en_us).
function LintSpell()
    set spell!
endfunc

" Keybindings
" ------------------------------------------------------------------------------
" Regular
inoremap jj <esc>|                                      " Rebind escape.

nmap ; :|                                               " Rebind colon.
nmap <c-a> 0|                                           " Rebind beginning of line.
nmap <c-e> $|                                           " Rebind end of line.

" Leader
let mapleader = "\<space>"|                             " Bind leader to spacebar.

" Leader General
noremap <leader>- <c-b><bar>zz|                         " Page up.
noremap <leader>= <c-f><bar>zz|                         " Page down.

noremap <leader>j 10j<cr>|                              " Jump 10 lines down.
noremap <leader>k 10k<cr>|                              " Jump 10 lines up.

" Leader Normal
nmap <leader>f /|                                       " Find regex, no nnoremap b/c SearchComplete.

nnoremap <leader>` :e $MYVIMRC<cr>|                     " Quick access to this file.
nnoremap <leader>1 :e . <cr>|                           " Open file tree.
nnoremap <leader>! :e scp://|                           " Open remote file tree.
nnoremap <leader>2 @@|                                  " Replay key macro q.
nnoremap <leader>@ @q|                                  " Play key macro q.
nnoremap <leader>3 :!ctags -R .|                        " Make ctags in dir.
nnoremap <leader>4 :call LintSpell()<cr>|               " Call function.
nnoremap <leader>0 zz                                   " Recenter window.

nnoremap <leader>Q :qall<cr>|                           " Quit if everything is saved.
nnoremap <leader>w :!goto_safari<cr>|                   " Call script.
nnoremap <leader>r :w<cr> :<c-p><cr>|                   " Write then redo prev command.
nnoremap <leader>t :tabnew<cr>|                         " New tab.
nnoremap <leader>T :tabnew<cr>:e .<cr>|                 " New tab + file tree.
nnoremap <leader>y 0wv$hy<cr>|                          " Yank a line without \n.
nnoremap <leader>i 0i<cr><esc>k|                        " Insert line.
nnoremap <leader>f :Files /Users/Eric/<cr>|                  " FZF by file.
nnoremap <leader>F :Files /|                            " FZF by file from /.
nnoremap <leader>[ <c-t>|                               " Return from def ctag.
nnoremap <leader>] <c-]>|                               " Goto function def ctag.

nnoremap <leader>s <c-w><c-w>|                          " Better window jumping.
nnoremap <leader>S :split<cr>|                          " Split new window below.
nnoremap <leader>l `.|                                  " Jump to last edit.
nnoremap <leader>L :call ToggleLines()<cr>|

nnoremap <leader>c :%s/\s\+$//<cr>|                     " Delete all trailing whitespace in file.
nnoremap <leader>b :bnext <cr>|                         " Cycle buffers.
nnoremap <leader>B :buffers <cr>|                       " List buffer(s).
nnoremap <leader>/ :noh<cr>|                            " Undo find highlighting.

" Plugin Settings
" ------------------------------------------------------------------------------
" FZF
let g:fzf_layout = { 'down': '~33%' }

" Lightline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active' : {
            \ 'left': [ ['paste' ],
            \           [ 'readonly', 'filename', 'modified' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ] ] ,
            \ },
            \ 'tabline': {
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [ ] ]
            \ },
            \ }

" Multiple Cursors
let g:multi_cursor_quit_key='q'

" Language support
" ------------------------------------------------------------------------------
" Haskell
let g:haskell_classic_highlighting = 1

" Python
let python_highlight_all = 1                            " Better python syntax highlighting.
