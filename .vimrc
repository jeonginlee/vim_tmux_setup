" Plugin settings
set nocompatible									" setting incompatibility with vi
filetype off                                        " required by vundle
set rtp+=~/.vim/bundle/Vundle.vim/					" add vundle to run time path
call vundle#rc()									" required by vundle

Plugin 'scrooloose/syntastic'                       " syntastic
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'marcopaganini/termschool-vim-theme'			" termschool color scheme
"colorscheme termschool 

call vundle#end()
filetype plugin indent on 


" Editing settings
set number											" set line numbers
set tabstop=4 softtabstop=4							" set tab length to 4
set noexpandtab shiftwidth=4						" tab settings
set wrap linebreak nolist							" set text soft wrapping 
set syntax=txt										" set universal txt file syntax
set hlsearch										" sighlight search
set incsearch										" sncremental search
set tw=80											" Text wrap after 80 lines
"set undofile										" save undos after closing a file
"set undodir=~/.vim/vimundo							" save them here
set smarttab                                        " smart tab handling for indenting
set smartindent
set cindent											" setting c style indent 
set foldmethod=indent								" fold same indent level
set foldlevel=99									" fold all the way	


" Syntastic settings
set statusline+=%#warningmsg#                         " syntastic recommended
set statusline+=%{SyntasticStatuslineFlag()}          " syntastic recommended        
set statusline+=%*                                    " syntastic recommended

let g:syntastic_always_populate_loc_list = 1          " syntastic recommended
let g:syntastic_auto_loc_list = 1                     " syntastic recommended
let g:syntastic_check_on_open = 1                     " syntastic recommended
let g:syntastic_check_on_wq = 0                       " syntastic recommended
let g:syntastic_cpp_compiler = 'g++'                  " syntastic c++11 support
let g:syntastic_cpp_compiler_options = ' -std=c++14'  " syntastic c++11 support
let g:syntastic_cpp_check_header = 1                  " syntastic cpp .h checking
let g:syntastic_cpp_config_file = '.syntastic_config' " syntastic config file for different projects


" Display settings
syntax on											" Set color scheme for syntax
set ruler											" Set ruler on bottom right corner
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Key rempapping
" No escape key!
inoremap jk  <esc>
inoremap kj  <esc>
inoremap hj  <esc>
inoremap jh  <esc> 
inoremap <esc>	 <nop>

" No arrow keys in normal mode. Can't fix insert mode yet...
noremap <left>   <nop>
noremap <right>  <nop>
noremap <up>	 <nop>
noremap <down>	 <nop>
"inoremap <down>  <nop>
"inoremap <up>    <nop>
"inoremap <right> <nop>
"inoremap <left>  <nop>
fixdel
set backspace=indent,eol,start


" Tabbing display and keymapping-------------------------------------------
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

" Keyboard Mappings ---------------------------------------------------------|

" change leader to ',' instead of '\'
let mapleader=','

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

" Map za to space for opening and closing folds
noremap <space> za

" Set auto indentations for Python
filetype indent plugin on
set modeline


