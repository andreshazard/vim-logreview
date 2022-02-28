if !exists("*RemoveDEBUGLogs")
    function RemoveDEBUGLogs()
        silent! execute "normal!  mz:g/DEBUG/d\<CR>'z"
    endfunction
endif
command! RemoveDEBUGLogs call RemoveDEBUGLogs()

if !exists("*RemoveINFOLogs")
    function RemoveINFOLogs()
        silent! execute "normal!  mz:g/INFO/d\<CR>'z"
    endfunction
endif
command! RemoveINFOLogs call RemoveINFOLogs()

if !exists("*RemoveVERBOSELogs")
    function RemoveVERBOSELogs()
        silent! execute "normal!  mz:g/VERBOSE/d\<CR>'z"
    endfunction
endif
command! RemoveVERBOSELogs call RemoveVERBOSELogs()

if !exists("*RemoveGREENLogs")
    function RemoveGREENLogs()
        execute "normal! mz:call RemoveINFOLogs()\<CR>"
        silent! execute "normal! :call RemoveDEBUGLogs()\<CR>'z"
        silent! execute "normal! :call RemoveVERBOSELogs()\<CR>'z"
    endfunction
endif
command! RemoveGREENLogs call RemoveGREENLogs()

if !exists("*RemoveWARNLogs")
    function RemoveWARNLogs()
        silent! execute "normal!  mz:g/WARN/d\<CR>'z"
    endfunction
endif
command! RemoveWARNLogs call RemoveWARNLogs()

if !exists("*RemoveAllButERRORLogs")
    function RemoveAllButERRORLogs()
        silent! execute "normal! mz:v/ERROR/d\<CR>'z"
    endfunction
endif
command! RemoveAllButERRORLogs call RemoveAllButERRORLogs()

if !exists("*RemoveAllButCRITICALLogs")
    function RemoveAllButCRITICALLogs()
        silent! execute "normal! mz:v/CRITICAL/d\<CR>'z"
    endfunction
endif
command! RemoveAllButCRITICALLogs call RemoveAllButCRITICALLogs()

if !exists("*RemoveAtExpLogs")
    function RemoveAtExpLogs()
        silent! execute "normal! mz:g/^\\s\*at\\s/d\<CR>'z"
    endfunction
endif
command! RemoveAtExpLogs call RemoveAtExpLogs()

if !exists("*RemoveButRangeDayTime")
    function RemoveButRangeDayTime(day,start,end)
            "we set the cursor at the first match of the start date, then delete everything above"
            execute "normal! gg/".a:day." ".a:start."\<CR>kVggx\<CR>"
            "we set the cursor at the last match of the end date, then delete everything below"
            execute "normal! G?".a:day." ".a:end."\<CR>jVGx\<CR>gg"
            execute "normal! gg"
    endfunction
endif
command! -nargs=* RemoveButRangeDayTime call RemoveButRangeDayTime(<f-args>)

if !exists("*RemoveButRangeFullDateTime")
    function RemoveButRangeFullDateTime(date,start,end)
            "we set the cursor at the first match of the start date, then delete everything above"
            execute "normal! gg/".a:date." ".a:start."\<CR>kVggx\<CR>"
            "we set the cursor at the last match of the end date, then delete everything below"
            execute "normal! G?".a:date." ".a:end."\<CR>jVGx\<CR>"
            execute "normal! gg"
    endfunction
endif
command! -nargs=* RemoveButRangeFullDateTime call RemoveButRangeFullDateTime(<f-args>)

if !exists("*RemoveAllButClass")
    function RemoveAllButClass(name)
        echom a:name
        if len(a:name) == 0
            echoerr "You must enter a class name"
        else
            silent! execute "normal! mz:v/".a:name."/d\<CR>'z"
        endif
    endfunction
endif
command! -nargs=1 RemoveAllButClass call RemoveAllButClass(<f-args>)

if !exists("*FoldStackBelow")
    function FoldStackBelow()
        silent! execute "normal! zf/^\\S\<CR>zzO\ejo\ek"
    endfunction
endif
command! FoldStackBelow call FoldStackBelow()
