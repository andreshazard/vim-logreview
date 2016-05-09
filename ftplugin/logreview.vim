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

if !exists("*RemoveGREENLogs")
    function RemoveGREENLogs()
        execute "normal! mz:call RemoveINFOLogs()\<CR>"
        silent! execute "normal! :call RemoveDEBUGLogs()\<CR>'z"
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

if !exists("*RemoveAtExpLogs")
    function RemoveAtExpLogs()
        silent! execute "normal! mz:g/^\\sat\\s/d\<CR>'z"
    endfunction
endif
command! RemoveAtExpLogs call RemoveAtExpLogs()

if !exists("*RemoveButRange")
    function RemoveButRange(day,start,end)
            "we set the cursor at the first match of the start date, then delete everything above"
            execute "normal! gg/".a:day." ".a:start."\<CR>kVggx\<CR>"
            "we set the cursor at the last match of the end date, then delete everything below"
            execute "normal! G?".a:day." ".a:end."\<CR>jVGx\<CR>"
    endfunction
endif
command! -nargs=* RemoveButRange call RemoveButRange(<f-args>)

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
