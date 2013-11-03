if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    vsplit __Potion_Bytecode__
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <LocalLeader>r :call PotionCompileAndRunFile()<CR>
nnoremap <buffer> <LocalLeader>b :call PotionShowBytecode()<CR>
