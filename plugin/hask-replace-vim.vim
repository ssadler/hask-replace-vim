if exists("g:__HASK_REPLACE_VIM__")
    finish
endif
let g:__HASK_REPLACE_VIM__ = 1

fun! ModuleReplace(args) "{{{
    " write the buffer in case we overwrite it
    normal w!
    execute '.!hr module ' . a:args
    execute 'checkt'
endfunction "}}}

command! -nargs=* MoveModule call ModuleReplace( '<args'> )
