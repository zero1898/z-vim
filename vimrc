"==========================================
" Author: nero
" Email: zero1898@foxmail.com
"==========================================

" Use bundles {
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
" }

" Use local vimrc {
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" }

" Use bundles config {
if filereadable(expand("~/.vimrc.bundles_config"))
    source ~/.vimrc.bundles_config
endif
