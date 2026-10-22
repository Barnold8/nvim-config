
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = " "
nnoremap <Space>r <cmd>Ranger<cr>
nnoremap <Space>f <cmd>Telescope find_files<cr>
nnoremap <Space>t <cmd>NERDtree<cr>
nnoremap <Space><Space> <cmd>WhichKey '<Space>'<cr>

let g:theme_cache_dir = stdpath('data') "To where .local/share is for nvim
let g:theme_cache_path = g:theme_cache_dir . '/current_theme.txt' "relative location from the share

if !isdirectory(g:theme_cache_dir)
    call mkdir(g:theme_cache_dir, "p")
endif

function! LoadSavedColorscheme()
    if filereadable(g:theme_cache_path)
        let l:lines = readfile(g:theme_cache_path)
        if !empty(l:lines)
            let l:saved_theme = trim(l:lines[0])
            if l:saved_theme != ''
                try
                    execute 'colorscheme ' . l:saved_theme
                    return
                catch
                    
                endtry
            endif
        endif
    endif
    try
        colorscheme default
    catch
    endtry
endfunction

call LoadSavedColorscheme()

augroup AutoSaveTheme
    autocmd!
    autocmd ColorScheme * if exists('g:colors_name') | call writefile([g:colors_name], g:theme_cache_path) | endif
augroup END


nnoremap <silent> <Space>c <cmd>Telescope colorscheme enable_preview=true<CR>


