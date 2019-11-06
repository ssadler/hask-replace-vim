if exists('g:__HASK_REPLACE_VIM__')
    finish
endif
let g:__HASK_REPLACE_VIM__ = 1

fun! ModuleReplace(args) "{{{

    " write the buffer in case we overwrite it
    exec 'normal! w!'
    execute 'silent !hr module . ' . a:args
    execute 'checkt'
    echo 'module moved successfully!'

endfunction "}}}

fun! IdrisReplace(args) "{{{

    " write the buffer in case we overwrite it
    exec 'normal! w!'
    execute 'silent !hr idris ' . a:args
    execute 'checkt'
    echo 'module moved successfully!'

endfunction "}}}

fun! ElmReplace(args) "{{{

    " write the buffer in case we overwrite it
    exec 'normal! w!'
    execute 'silent !hr elm ' . a:args
    execute 'checkt'
    echo 'module moved successfully!'

endfunction "}}}

fun! PurescriptReplace(args) "{{{

    " write the buffer in case we overwrite it
    exec 'normal! w!'
    execute 'silent !hr purescript ' . a:args
    execute 'checkt'
    echo 'module moved successfully!'

endfunction "}}}


fun! ModuleDuplicate(args) "{{{

    " Get current file name and convert it to a 
    let current_file = expand('%')
    let pre_module = substitute(current_file, '\/', '.', 'g')
    let current_module = substitute(pre_module, 'src\.\|\.hs', '', 'g')

    " write the buffer in case we overwrite it
    exec 'normal! w!'
    execute 'silent !hr module . ' . current_module . ' ' . a:args . ' ' . '--copy'
    execute 'checkt'
    echo 'module duplicated successfully!'

endfunction "}}}

fun! PurescriptDuplicate(args) "{{{

    " Get current file name and convert it to a 
    let current_file = expand('%')
    let pre_module = substitute(current_file, '\/', '.', 'g')
    let current_module = substitute(pre_module, 'src\.\|\.purs', '', 'g')

    " write the buffer in case we overwrite it
    exec 'normal! w!'
    execute 'silent !hr purescript . ' . current_module . ' ' . a:args . ' ' . '--copy'
    execute 'checkt'
    echo 'module duplicated successfully!'

endfunction "}}}


augroup haskell
    autocmd FileType haskell,hspec command! -nargs=* MoveMod call ModuleReplace('<args>')
    autocmd FileType haskell,hspec command! -nargs=1 Duplicate call ModuleDuplicate (<f-args>)
augroup END
augroup idris
    autocmd FileType idris command! -nargs=* MoveMod call IdrisReplace('<args>')
augroup END
augroup elm
    autocmd FileType elm command! -nargs=* MoveMod call ElmReplace('<args>')
augroup END
augroup purescript
    autocmd FileType purescript command! -nargs=* MoveMod call PurescriptReplace('<args>')
    autocmd FileType purescript command! -nargs=1 Duplicate call PurescriptDuplicate (<f-args>)
augroup END
