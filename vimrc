call pathogen#infect()
set nocompatible                " vim comfort instead of vi compatibility
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

set ts=4    " tab and shift width
set sw=4    "
set et      " expand tabs to spaces
set smarttab
set autoindent
set smartindent

set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

let &guicursor = &guicursor . ",a:blinkon0"
set cursorline

set statusline=%F%m%r%h%w(%{&ff},%Y,%{&fenc})\ [\%03.3b,0x\%02.2B]@%o
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
set guioptions='acirlmgt'
set showtabline=2
set guifont=Monospace\ 11

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
let NERDTreeIgnore=['\.beam$','\.pyc$','\.jpg$','\.gif$','\.png$','\.zip$', '\~$', '\.pdf$','\.aus$','\.lo$','\.o$']

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
