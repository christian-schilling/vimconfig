set nocompatible                " vim comfort instead of vi compatibility
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

set ts=8    " tab and shift width
set sw=8    " 
set noet      " expand tabs to spaces
set smarttab
set autoindent
set smartindent
match ErrorMsg /\t/ " highlight tabs as errors

let &guicursor = &guicursor . ",a:blinkon0"
set cursorline

set statusline=%F%m%r%h%w(%{&ff},%Y)\ [\%03.3b,0x\%02.2B]@%o%=\ line:%l,%v\ (%p%%)
set laststatus=2

color darkspectrum
syntax on       " highlight syntax
set hlsearch    " highlight searches

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
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
set guioptions='acirmgt'
set showtabline=2
set guifont=Monospace\ 12

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1


" NERDTree configuration...
" map <F7> to toggle NERDTree window
nmap <silent> <F8> :BufExplorer<CR>
nmap <silent> <F9> :NERDTreeToggle<CR>
nmap <silent> <F10> :TlistToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeIgnore=['.pyc$','.jpg$','.gif$','.png$','.zip$', '\~$', '.pdf$','.aus$','.lo$','.o$']

