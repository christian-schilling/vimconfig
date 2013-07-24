python import ctypes,os
python ctypes.cdll.LoadLibrary(os.getenv('HOME')+'/.vim/libffi.so.6')
python ctypes.cdll.LoadLibrary(os.getenv('HOME')+'/.vim/libLLVM-3.3.so')

set pastetoggle=<F2>

map  <Nul> <Esc>
vmap <Nul> <Esc>
cmap <Nul> <Esc>
nmap <Nul> <Esc>
imap <Nul> <Esc>
smap <Nul> <Esc>

inoremap <c-Space> <Esc>
vnoremap <c-Space> <Esc>
noremap <c-Space> <Esc>
snoremap <c-Space> <Esc>

vmap <c-s> <Esc>:wa<CR>
imap <c-s> <Esc>:wa<CR>
nmap <c-s> :wa<CR>

inoremap <C-l> <C-x><C-o>
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:tagbar_iconchars = ['▸', '▾']
let g:ctrlp_map = '<leader>f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:clang_complete_auto = 0
let g:clang_library_path = $HOME.'/.vim'

"set updatetime=1000

let g:signify_mapping_next_hunk = '<M-]>'
let g:signify_mapping_prev_hunk = '<M-[>'
call pathogen#infect()
set nocompatible               " vim comfort instead of vi compatibility
set backspace=indent,eol,start " allow backspacing
                               " over everything in insert mode
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set novisualbell
set noswapfile

set completeopt-=preview
set scrolloff=3

"set nofoldenable

" Source the vimrc file after saving it
autocmd! bufwritepost .vimrc source $MYVIMRC

let mapleader = " "
nmap <leader>v :edit $MYVIMRC<CR>
nmap <leader>b :wa<CR>:make<CR>:cw<CR>

nmap <leader>gj :wa<CR>:silent cfile `~/.vim/bin/git-jump diff`<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gl :silent Glog<CR>:cw<CR>
nmap <leader>go :cclose<CR>:Gedit<CR>

nmap <M-p> :diffput<CR>:diffupdate<CR>
nmap <M-o> :diffget<CR>:diffupdate<CR>
vmap <M-p> :diffput<CR>:diffupdate<CR>
vmap <M-o> :diffget<CR>:diffupdate<CR>

set hidden

set ts=4    " tab and shift width
set sw=4    "
set et      " expand tabs to spaces
set smarttab
set autoindent
set smartindent
set rnu

" augroup vimrc_autocmds
"   autocmd BufEnter *.py,*.c,*.cpp,*.h,*.hpp highlight OverLength ctermbg=darkgrey guibg=#ff0000
"   autocmd BufEnter *.py,*.c,*.cpp,*.h,*.hpp match OverLength /\%80v.*/
" augroup END

set tw=80
set colorcolumn=80
set nowrap
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:→
set formatoptions+=t

let &guicursor = &guicursor . ",a:blinkon0"
set cursorline

set diffopt=filler,context:1000000

" autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

set statusline=%{fugitive#statusline()}
set statusline+=%F%m%r%h%w(%{&ff},%Y,%{&fenc})\ [\%03.3b,0x\%02.2B]@%o
set laststatus=2

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*
set statusline+=%=\ line:%l,%v\ (%p%%)

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[tabs]' if tabs are used to indent
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            set noet
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces)
            set et
            let b:statusline_tab_warning = ''
        elseif (tabs)
            set noet
            let b:statusline_tab_warning = '[tabs]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

hi MatchParen cterm=bold ctermbg=none ctermfg=none
hi MatchParen gui=bold guibg=NONE guifg=NONE

color hybrid
syntax on       " highlight syntax
set hlsearch    " highlight searches



" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an
" event handler
" (happens when dropping a file on gvim).
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" spelling
" set spell
set spelllang=en,de

" autosave on buffer exit
set autowriteall

" Backups are good, but put them in another dir
set backup
set backupdir=~/.backups

" no tool bar please
set guioptions='acigt'
set showtabline=1
set guifont=Inconsolata-dz\ for\ Powerline\ 11
"set guifont=Inconsolata\ 12

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1

inoremap <F8> <C-O>za
nnoremap <F8> za
onoremap <F8> <C-C>za
vnoremap <F8> zf

nnoremap <left> :vertical resize -10<cr>
nnoremap <down> :resize +10<cr>
nnoremap <up> :resize -10<cr>
nnoremap <right> :vertical resize +10<cr>

nnoremap <C-left> :vertical resize -1<cr>
nnoremap <C-down> :resize +1<cr>
nnoremap <C-up> :resize -1<cr>
nnoremap <C-right> :vertical resize +1<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set omnifunc=syntaxcomplete#Complete

vnoremap <S-K> :s/[\[\(,]/&\r/g<CR>:s/[\]\)]/\r&/g<CR>:noh<CR>
map <M-8> :silent execute 'silent Ggrep -w ' . expand("<cword>") <Bar> :cw<CR>
map <M-t> :silent execute 'silent Ggrep -w TODO'<Bar> :cw<CR>
map <M-j> :cn<CR>
map <M-k> :cp<CR>
map <M-#> :cclose<CR>

nmap <silent><leader>t :TagbarOpen fj<CR>
nmap <silent><leader><C-t> :TagbarClose<CR>
" NERDTree configuration...
" map toggle NERDTree window
nmap <silent> <leader><C-f> :NERDTreeToggle<CR>
nmap <silent> <leader>/ :noh<CR>
let NERDTreeChDirMode = 2
let NERDTreeMinimalUI = 2
let NERDTreeIgnore=['\.beam$','\.pyc$','\.jpg$','\.gif$','\.png$','\.zip$', '\~$', '\.pdf$','\.aus$','\.lo$','\.o$']

set wildignore+=*.o,*.obj


autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
au BufRead,BufNewFile SConstruct        setfiletype python

" fix alt in dumb terminals
let c='a'
while c <= 'z'
exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
