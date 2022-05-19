set number
set hls

set guifont=Ricty\ Diminished:h14
set guifontwide=Ricty\ Diminished:h14

call plug#begin()
runtime! ./plugins/*.vim
call plug#end()

colorscheme elly
set termguicolors
