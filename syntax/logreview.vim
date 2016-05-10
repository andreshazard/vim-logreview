if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "logreview"
syntax keyword logYellow WARN WARNING
syntax keyword logGreen INFO DEBUG LOG
syntax keyword logRed  STACK Stack stack SEVERE Severe severe
syntax match logRed "for programmers"
syntax keyword logError Exception exception ERROR FATAL

highlight Keyword ctermfg=Yellow
highlight link logYellow Keyword

highlight Label ctermfg=LightGreen
highlight link logGreen Label

highlight Tag ctermfg=Red
highlight link logRed Tag

highlight link logError Error
