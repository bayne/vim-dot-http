if !exists("g:dot_http_env")
    let g:dot_http_env = 'dev'
endif 

function! dot_http#DotHttpRun() 
    execute 'vne | setlocal buftype=nofile | setlocal bufhidden=hide | setlocal noswapfile | r! dot-http -e '. g:dot_http_env .' '. expand('%:p') . ' -l ' . line('.')
    normal gg
endfunction
