" ########################################################################
" Custom Functions
" ########################################################################

" Toggle the sign column
function! ToggleSignColumn()
    if &scl == 'no'
        set scl=auto
    else
        set scl=no
    endif
endfunction

" Function to toggle textwidth bar
function! ToggleTextWidth()
    " if the textwidth is not set and the width is greater than 120 chars
    if (&textwidth == 0)
        set textwidth=120
        set colorcolumn=+1
    else
        set textwidth=0
    endif
endfunction

" Toggle relative line numbers
function! ToggleRelativeLineNumbers()
    if (&relativenumber)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

" Toggle indenting with tabs and spaces
function! ToggleIndentType()
    if &expandtab == 1
        set noexpandtab
    else
        set expandtab
    endif
endfunction

" ########################################################################
" ######## Navigation
" ########################################################################
" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Use CTRL + h/j/k/l to move between buffers instead of CTRL + W + (HJKL)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" make wrapped lines more intuitive. Pressing j/k moves to the next/previous
" line even if wrppaed and the 'next' line is still the same line. Same for 0
" and $
noremap <silent> k gk
noremap <silent> j gj

" ########################################################################
" ######## Toggle Commands
" ########################################################################

nnoremap <Leader>sc :call ToggleSignColumn()<CR>

" Toggle wrap mode
nnoremap <Leader>wr :set wrap!<CR>

" Toggle highlighting of search results
nnoremap <Leader>hl :set hlsearch!<CR>

nnoremap <Leader><Leader>rn :call ToggleRelativeLineNumbers()<CR>

nmap <Leader>t :call ToggleIndentType()<CR>

nnoremap <silent> tw :call ToggleTextWidth()<CR>

" Toggle folds with space key in normal and visual mode
nnoremap <Space> za
vnoremap <Space> za

" ########################################################################
" ######## Buffer and Window Management
" ########################################################################
" Move to the next buffer
nnoremap <Leader>n :bn<CR>

" Move to the previous buffer
nnoremap <Leader>p :bp<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>

" Split the current window vertically or horizontally
nnoremap <Leader>vp :vsplit<CR>
nnoremap <Leader>hp :split<CR>

" Vertically and horizontally resize a window
nnoremap <Leader>vs :vertical resize +
nnoremap <Leader>hs :resize +

nnoremap <Leader>ah <C-W>H
nnoremap <Leader>aj <C-W>J
nnoremap <Leader>ak <C-W>K
nnoremap <Leader>al <C-W>L

" ########################################################################
" ######## Miscellaneous
" ########################################################################
nnoremap <Leader>r :source ~/.vimrc<CR>

" Display the path of the current file
nnoremap <Leader>pwf :echo expand("%p")<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Search for visually selected text using `//` ignoring any reg ex characters
" y will yank the selected text
" / will enter search mode
" \M sets vim to ignore any reg ex characters like * or . and use their literal
" value
" <C-R>" pastes the yanked text into the search bar
" <CR> is enter to execute the search
vnoremap // y/\M<C-R>"<CR>

" Don't jump to the next occurrence automatically when searching via *
nnoremap * *N

" Make delimitMateCR play nicely with pop up menu
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

inoremap jj <ESC>
