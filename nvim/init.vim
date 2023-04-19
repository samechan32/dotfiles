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

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
