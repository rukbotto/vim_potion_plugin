if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    write
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    write

    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    let str_start = match(bytecode, "** Syntax error")
    if str_start !=? -1
        echom bytecode
        return
    endif

    let curr_buf_wnr = bufwinnr(bufname("%"))

    let bytec_buf_exists = bufexists("__Potion_Bytecode__")
    let bytec_buf_wnr = bufwinnr(bufname("__Potion_Bytecode__"))
    let bytec_buf_nr = bufnr(bufname("__Potion_Bytecode__"))

    if bytec_buf_wnr ==? -1 && bytec_buf_exists
        vnew
        execute "edit \#" . bytec_buf_nr
    elseif bytec_buf_wnr >=? 0 && bytec_buf_exists
        execute bytec_buf_wnr . "wincmd w"
    elseif !bytec_buf_exists
        vsplit __Potion_Bytecode__
        setlocal filetype=potionbytecode
        setlocal buftype=nofile
    endif

    normal! ggdG
    call append(0, split(bytecode, '\v\n'))

    execute curr_buf_wnr . "wincmd w"
endfunction

nnoremap <buffer> <LocalLeader>r :call PotionCompileAndRunFile()<CR>
nnoremap <buffer> <LocalLeader>b :call PotionShowBytecode()<CR>
