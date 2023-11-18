" Plugins ------------------------------------------------------------------
call plug#begin()
" The default plugin directory will be as follows:
" "   - Vim (Linux/macOS): '~/.vim/plugged'
" "   - Vim (Windows): '~/vimfiles/plugged'
" "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" " You can specify a custom plugin directory by passing it as the argument
" "   - e.g. `call plug#begin('~/.vim/plugged')`
" "   - Avoid using standard Vim directory names like 'plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
filetype indent off   " Disable file-type-specific indentation
syntax off            " Disable syntax highlighting

" Key rempapping -----------------------------------------------------------
" No escape key!
inoremap jk  <esc>
inoremap kj  <esc>
inoremap hj  <esc>
inoremap jh  <esc> 
inoremap JK  <esc>
inoremap KJ  <esc>
inoremap HJ  <esc>
inoremap JH  <esc> 

" Editing settings ---------------------------------------------------------
set number							" set absolute for current line
set relativenumber					" set relative line numbers
set tabstop=4 softtabstop=4			" set tab length 
set shiftwidth=4
set noexpandtab						" allow \t
set smartindent autoindent

set syntax=txt						" set default syntax filetype
set hlsearch						" highlights search
set incsearch						" incremental search
set ruler
set tw=80							" tab width
syntax on

set backspace=indent,eol,start

let mapleader=','					" '\' by default

set foldmethod=indent								" fold same indent level
set foldlevel=99									" fold all the way	

noremap <space> za                                  " Map za to space for opening and closing folds


" Tab settings ----------------------------------------------------------------
function MyTabLine()
  let line = 'Tabs:'
  let i = 1
  while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let line .= '%' . i . 'T'
    let line .= (i == tabpagenr() ? '%1*' : '%2*')
    let line .= (' ' . i . ') %*')
    let line .= (i == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let file = bufname(buflist[winnr - 1])
    let file = fnamemodify(file, ':p:t')
    if file == ''
      let file = '[No Name]'
    endif
    let line .= file
    let i = i + 1
  endwhile
  let line .= '%T%#TabLineFill#%='
  let line .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
  return line
endfunction
set tabline=%!MyTabLine()
hi TabLine ctermfg=White ctermbg=Black cterm=underline
hi TabLineSel ctermfg=Red ctermbg=Black cterm=underline
hi TabLineFill ctermfg=Black ctermbg=White

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
