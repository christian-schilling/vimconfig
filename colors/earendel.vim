hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "earendel"

if &background == "light"
    hi Normal ctermbg=White ctermfg=Black guibg=White guifg=Black gui=none

    hi Cursor guibg=Black guifg=White gui=none
    hi CursorColumn ctermbg=LightGray ctermfg=fg guibg=Gray90 gui=none
    hi CursorLine ctermbg=LightGray ctermfg=fg guibg=Gray90 gui=none
    hi DiffAdd guibg=PaleGreen2 guifg=fg gui=none
    hi DiffChange guibg=LightBlue guifg=fg gui=none
    hi DiffDelete guibg=LightRed guifg=fg gui=none
    hi DiffText guibg=LightSlateBlue guifg=fg gui=bold
    hi Directory guibg=bg guifg=Blue2 gui=none
    hi ErrorMsg guibg=Red2 guifg=White gui=bold
    hi FoldColumn ctermbg=bg guibg=bg guifg=Gray50 gui=none
    hi Folded guibg=Gray80 guifg=Gray30 gui=bold
    hi IncSearch guibg=LightGreen gui=none
    hi LineNr guibg=bg guifg=Gray50 gui=none
    hi ModeMsg ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=bold
    hi MoreMsg guibg=bg guifg=Gray30 gui=bold
    hi NonText ctermfg=DarkGray guibg=bg guifg=Gray50 gui=bold
    hi Pmenu guibg=Gray75 guifg=fg gui=none
    hi PmenuSbar guibg=Gray55 guifg=fg gui=none
    hi PmenuSel guibg=Yellow guifg=fg gui=none
    hi PmenuThumb guibg=Gray85 guifg=fg gui=none
    hi Question guibg=bg guifg=Gray30 gui=bold
    hi Search guibg=LightYellow gui=none
    hi SignColumn ctermbg=bg guibg=bg guifg=Gray50 gui=none
    hi SpecialKey guibg=bg guifg=DarkOrange4 gui=none
    hi StatusLine ctermbg=Black ctermfg=White guibg=Gray70 guifg=fg gui=bold
    hi StatusLineNC ctermbg=LightGray ctermfg=fg guibg=Gray70 guifg=fg gui=none
    if has("spell")
        hi SpellBad guisp=Red gui=undercurl
        hi SpellCap guisp=Blue gui=undercurl
        hi SpellLocal guisp=DarkCyan gui=undercurl
        hi SpellRare guisp=Magenta gui=undercurl
    endif
    hi TabLine guibg=Gray75 guifg=fg gui=underline
    hi TabLineFill guibg=Gray75 guifg=fg gui=underline
    hi TabLineSel guibg=bg guifg=fg gui=bold
    hi Title guifg=fg gui=bold
    hi VertSplit ctermbg=LightGray ctermfg=fg guibg=Gray70 guifg=fg gui=none
    if version >= 700
        hi Visual ctermbg=LightGray ctermfg=fg guibg=Gray85 gui=none
    else
        hi Visual ctermbg=LightGray ctermfg=fg guibg=Gray85 guifg=fg gui=none
    endif    
    hi VisualNOS ctermbg=DarkGray ctermfg=fg guibg=bg guifg=Gray50 gui=bold,underline
    hi WarningMsg guibg=bg guifg=Red2 gui=bold
    hi WildMenu guibg=Yellow guifg=fg gui=bold

    hi Comment guibg=bg guifg=DarkGreen gui=none
    hi Constant guibg=bg guifg=DarkOrange3 gui=none
    hi Error guibg=bg guifg=Red gui=none
    hi Identifier guibg=bg guifg=DarkCyan gui=none
    hi Ignore guibg=bg guifg=White gui=none
    hi lCursor guibg=DarkGreen guifg=White gui=none
    hi MatchParen guibg=Cyan4 guifg=White gui=none
    hi PreProc guibg=bg guifg=Purple3 gui=none
    hi Special guibg=bg guifg=DarkOrange4 gui=none
    hi Statement guibg=bg guifg=Blue2 gui=none
    hi Todo guibg=Yellow guifg=fg gui=none
    hi Type guibg=bg guifg=Blue3 gui=none
    hi Underlined ctermbg=bg ctermfg=fg guibg=bg guifg=Blue2 gui=underline

    hi htmlBold ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=bold
    hi htmlBoldItalic ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=bold,italic
    hi htmlBoldUnderline ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=bold,underline
    hi htmlBoldUnderlineItalic ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=bold,underline,italic
    hi htmlItalic ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=italic
    hi htmlUnderline ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=underline
    hi htmlUnderlineItalic ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=underline,italic
else
    hi Normal ctermbg=Black ctermfg=LightGray guibg=Gray10 guifg=Gray80 gui=none

    hi Cursor guibg=Gray90 guifg=Black gui=none
    hi CursorColumn ctermbg=DarkGray ctermfg=White guibg=Gray25 gui=none
    hi CursorLine ctermbg=DarkGray ctermfg=White guibg=Gray25 gui=none
    hi DiffAdd guibg=PaleGreen4 guifg=Gray85 gui=none
    hi DiffChange guibg=DarkBlue guifg=fg gui=none
    hi DiffDelete guibg=DarkRed guifg=fg gui=none
    hi DiffText guibg=DarkSlateBlue guifg=fg gui=bold
    hi Directory guibg=bg guifg=Blue gui=none
    hi ErrorMsg guibg=Red3 guifg=Gray90 gui=bold
    hi FoldColumn ctermbg=bg guibg=bg guifg=Gray45 gui=none
    hi Folded guibg=Gray40 guifg=fg gui=bold
    hi IncSearch guibg=Green4 guifg=Gray95 gui=none
    hi LineNr guibg=bg guifg=Gray50 gui=none
    hi ModeMsg ctermbg=bg ctermfg=fg guibg=bg guifg=fg gui=bold
    hi MoreMsg guibg=bg guifg=Gray70 gui=bold
    hi NonText ctermfg=DarkGray guibg=bg guifg=Gray50 gui=bold
    hi Pmenu guibg=Gray35 guifg=fg gui=none
    hi PmenuSbar guibg=Gray45 guifg=fg gui=none
    hi PmenuSel guibg=Yellow3 guifg=Black gui=none
    hi PmenuThumb guibg=Gray15 guifg=fg gui=none
    hi Question guibg=bg guifg=Gray70 gui=bold
    hi Search guibg=Yellow4 guifg=Gray90 gui=none
    hi SignColumn ctermbg=bg guibg=bg guifg=Gray50 gui=none
    hi SpecialKey guibg=bg guifg=DarkOrange3 gui=none
    hi StatusLine ctermbg=LightGray ctermfg=Black guibg=Gray45 guifg=White gui=bold
    hi StatusLineNC ctermbg=LightGray ctermfg=Black guibg=Gray45 guifg=Gray90 gui=none
    if has("spell")
        hi SpellBad guisp=LightRed gui=undercurl
        hi SpellCap guisp=LightBlue gui=undercurl
        hi SpellLocal guisp=LightCyan gui=undercurl
        hi SpellRare guisp=DarkMagenta gui=undercurl
    endif
    hi TabLine guibg=Gray30 guifg=fg gui=underline
    hi TabLineFill guibg=Gray30 guifg=fg gui=underline
    hi TabLineSel guibg=bg guifg=fg gui=bold
    hi Title guifg=fg gui=bold
    hi VertSplit ctermbg=LightGray ctermfg=Black guibg=Gray45 guifg=Gray90 gui=none
    if version >= 700
        hi Visual ctermbg=LightGray ctermfg=Black guibg=Gray35 gui=none
    else
        hi Visual ctermbg=LightGray ctermfg=Black guibg=Gray35 guifg=fg gui=none
    endif    
    hi VisualNOS ctermbg=DarkGray ctermfg=Black guibg=bg guifg=Gray50 gui=bold,underline
    hi WarningMsg guibg=bg guifg=Red2 gui=bold
    hi WildMenu guibg=Yellow3 guifg=Black gui=bold

    hi Comment guibg=bg guifg=PaleGreen3 gui=none
    hi Constant guibg=bg guifg=Sienna2 gui=none
    hi Error guibg=bg guifg=Red2 gui=none
    hi Identifier guibg=bg guifg=Cyan3 gui=none
    hi Ignore guibg=bg guifg=fg gui=none
    hi lCursor guibg=LightGreen guifg=Black gui=none
    hi MatchParen guibg=Cyan3 guifg=Black gui=none
    hi PreProc guibg=bg guifg=Violet gui=none
    hi Special guibg=bg guifg=DarkOrange3 gui=none
    hi Statement guibg=bg guifg=LightBlue gui=none
    hi Todo guibg=Yellow2 guifg=bg gui=none
    hi Type guibg=bg guifg=LightBlue gui=none
    hi Underlined ctermbg=Black ctermfg=White guibg=bg guifg=Blue gui=underline

    hi htmlBold ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=bold
    hi htmlBoldItalic ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=bold,italic
    hi htmlBoldUnderline ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=bold,underline
    hi htmlBoldUnderlineItalic ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=bold,underline,italic
    hi htmlItalic ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=italic
    hi htmlUnderline ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=underline
    hi htmlUnderlineItalic ctermbg=bg ctermfg=White guibg=bg guifg=fg gui=underline,italic
endif

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline
