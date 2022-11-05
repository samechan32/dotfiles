set number
set hls
set tabstop=4
set shiftwidth=4
set encoding=utf-8

set guifont=Ricty\ Diminished:h14
set guifontwide=Ricty\ Diminished:h14
set clipboard=unnamed

call plug#begin()
runtime! ./plugins/*.vim
call plug#end()

let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'

colorscheme elly
set termguicolors
