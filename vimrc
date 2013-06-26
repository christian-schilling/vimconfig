set pastetoggle=<F2>

map  <Nul> <Esc>
vmap <Nul> <Esc>
cmap <Nul> <Esc>
nmap <Nul> <Esc>
imap <Nul> <Esc>

inoremap <c-Space> <Esc>
vnoremap <c-Space> <Esc>
noremap <c-Space> <Esc>

vmap <c-s> <Esc>:wa<CR>
imap <c-s> <Esc>:wa<CR>
nmap <c-s> :wa<CR>

let g:ctrlp_map = '<leader>f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

call pathogen#infect()
set nocompatible               " vim comfort instead of vi compatibility
set backspace=indent,eol,start " allow backspacing
                               " over everything in insert mode
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set visualbell
set noswapfile

set scrolloff=3

set nofoldenable

" Source the vimrc file after saving it
autocmd! bufwritepost .vimrc source $MYVIMRC

let mapleader = " "
nmap <leader>v :edit $MYVIMRC<CR>
nmap <leader>m :wa<CR>:make<CR>

set hidden

set ts=4    " tab and shift width
set sw=4    "
set et      " expand tabs to spaces
set smarttab
set autoindent
set smartindent

augroup vimrc_autocmds
  autocmd BufEnter *.py,*.c,*.cpp,*.h,*.hpp highlight OverLength ctermbg=darkgrey guibg=#ff0000
  autocmd BufEnter *.py,*.c,*.cpp,*.h,*.hpp match OverLength /\%80v.*/
augroup END

set tw=79
set nowrap
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:→
set formatoptions-=t

let &guicursor = &guicursor . ",a:blinkon0"
set nocursorline

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

color desert
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
set guioptions='acirlmgt'
set showtabline=2
set guifont=Monospace\ 11

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

nnoremap <C-left> :vertical resize -1<cr>
nnoremap <C-down> :resize +1<cr>
nnoremap <C-up> :resize -1<cr>
nnoremap <C-right> :vertical resize +1<cr>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <silent> <M-8> :execute "vimgrep /" . expand("<cword>") . "/j `git ls-files`" <Bar> cw<CR>
map <M-n> :cn<CR>
map <M-S-n> :cp<CR>
map <M-#> :cclose<CR>

" NERDTree configuration...
" map toggle NERDTree window
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>/ :noh<CR>
let NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.beam$','\.pyc$','\.jpg$','\.gif$','\.png$','\.zip$', '\~$', '\.pdf$','\.aus$','\.lo$','\.o$']

set wildignore+=*.o,*.obj


autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
au BufRead,BufNewFile SConstruct        setfiletype python
