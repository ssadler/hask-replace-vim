if exists("g:__HASK_REPLACE_VIM__")
    finish
endif
let g:__HASK_REPLACE_VIM__ = 1

fun! ModuleReplace(args) "{{{

    " write the buffer in case we overwrite it
    normal w!
    execute '!hr module . ' . a:args
    execute 'checkt'

endfunction "}}}

fun! IdrisReplace(args) "{{{

    " write the buffer in case we overwrite it
    normal w!
    execute '!hr idris ' . a:args
    execute 'checkt'

endfunction "}}}

fun! ElmReplace(args) "{{{

    " write the buffer in case we overwrite it
    normal w!
    execute '!hr elm ' . a:args
    execute 'checkt'

endfunction "}}}

fun! ModuleDuplicate(args) "{{{

    " Get current file name and convert it to a 
    let current_file = expand('%')
    let pre_module = substitute(current_file, '\/', '.', 'g')
    let current_module = substitute(pre_module, '(src\.|\.hs)', '', 'g')
    " echo current_module

    " write the buffer in case we overwrite it
    normal w!
    execute '!hr module . ' . current_module . ' ' . a:args . ' ' . '--copy'
    execute 'checkt'

endfunction "}}}

command! -nargs=* MoveMod call ModuleReplace('<args>')
command! -nargs=* MoveIdris call IdrisReplace('<args>')
command! -nargs=* MoveElm call ElmReplace('<args>')
command! -nargs=1 Duplicate call ModuleDuplicate (<f-args>)

nnoremap <Plug>MoveElmMod :MoveElm
nnoremap <Plug>MoveIdrisMod :MoveIdris
nnoremap <Plug>DuplicateHaskellMod :Duplicate
