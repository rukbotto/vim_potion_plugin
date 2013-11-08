if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

nnoremap <buffer> <LocalLeader>r 
        \ :call potion#running#PotionCompileAndRunFile()<CR>
nnoremap <buffer> <LocalLeader>b 
        \ :call potion#running#PotionShowBytecode()<CR>
