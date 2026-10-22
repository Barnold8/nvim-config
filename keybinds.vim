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


" ================== Taken directly from the barbar repo usage example ==================

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Goto pinned/unpinned buffer
"                          :BufferGotoPinned
"                          :BufferGotoUnpinned

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-s-p>  <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
