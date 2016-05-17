# vim-logreview

Plugin to help review logs files within VIM.
This was created with Java log files in mind, however the functionality could work
for other log files as well or you can edit this plugin or send a pull requeest to suite your needs.

## Instalation

You can use [Pathogen](https://github.com/tpope/vim-pathogen)
```
git clone https://github.com/andreshazard/vim-logreview.git
~/.vim/bundle/vim-logreview.vim
```
For [Vundle](https://github.com/VundleVim/Vundle.vim)
add to your vimrc
```
Plugin 'andreshazard/vim-logreview'
```

## Usage

The plugin will detect your .log files and set the filetype as logreview.
If you need work with log files  that do not have the .log extension.
You can run :

```
set filetype=logreview
```

The logreview file types will have highlighting on specific keywords like : INFO, DEBUG, WARN, ERROR, etc. You can see
this on the syntax folder.

![snapshot](http://i.imgur.com/uQoem3G.png)


## Functions

The plugin will load the following commands when working with a logreview file types.

`:RemoveDEBUGLogs` Will remove all lines containing a "DEBUG" log <br>
`:RemoveINFOLogs` Will remove all lines containing a "INFO" log <br>
`:RemoveGREENLogs` Will remove all lines containing a "INFO" or "DEBUG" log <br>
`:RemoveWARNLogs` Will remove all lines containing a "WARN" log <br>
`:RemoveAllButERRORLogs` Will remove all lines that do not contain an "ERROR" log <br>
`:RemoveAtExpLogs` Will remove all lines that contain an " at com.project.package classname test" type log <br>

![gif](http://i.imgur.com/ppv97Qx.gif)

`:RemoveButRangeDayTime day start end`<br>

This will remove all lines except the ones on the range you provided. For example you can call : <br>
*RemoveButRange 09 10:52 10:54* 
to get only the logs between 10:52 and 10:54 on day 09. This works
using the search command so a line cotaining those lines needs to exist on the file.
Example of a log line where this would work :<br> 

*2016-04-07 10:52:04,459 [AsyncAppender-Dispatcher-Thread-18] DEBUG com.whatever.module.mail.service*

`:RemoveButRangeFullDateTime date start end`<br>

This will remove all lines except the ones on the range you provided. For example you can call : <br>
*RemoveButRange 08.04.2016 10:52 10:54* <br>

to get only the logs between 10:52 and 10:54 of the date 08.04.2016. This works
using the search command so a line cotaining those lines needs to exist on the file.
Example of a log line where this would work :<br> 

*08.04.2016 10:52:04,459 [AsyncAppender-Dispatcher-Thread-18] DEBUG com.trainingrocket.module.mail.service*

`:RemoveAllButClass`<br>

This will remove all lines except the ones containing the string you passed to the function.
For example you can call :
*RemoveAllBut com.example.my_bad_class* to get only logs relatd to this class.

![gif](http://i.imgur.com/VsouksS.gif)

`:FoldStackBelow`<br>

This will create a mark fold of the stack below the cursor. It assumes that the stack lines start
with at lease one space.

![gif](http://i.imgur.com/rrVUKji.gif)

##Mappings

You can map the commands that you use the most on your vimrc. 
For example : 

`:nnoremap <leader>bf :call FoldStackBelow()<CR>`

