" Vim syntax file
" Language: PHITS input file
" Maintainer: Jean-Michel Bereder
" Latest Revision:  19 Nov 2015

" Check whether the syntax file already exists
if exists("b:current_syntax")
    finish
endif

" ---------------------Ignore case-----------------------
syn case    ignore
" -------------------------------------------------------

" ---------------------Hilight for cell name -----------------------
syn match   inpCell "\#\d\+"
" ------------------------------------------------------------------

" ---------------------Hilight for Section----------------------------
syn region  inpSection start=/\[/ end=/\]/ contains=inpNumber
" --------------------------------------------------------------------

" ---------------------Hilight for TODO and off-----------------------
syn keyword inpTodo contained TODO NOTE
syn keyword inpOff off 
" ---------------------------------------------------------------

" ---------------------Hilight for Comment-----------------------
syn match   inpComment "\$.*$"    contains=inpTodo
syn match   inpComment "\#\D.*$"  display  contains=inpTodo
syn match   inpComment "%.*$"     contains=inpTodo
syn match   inpComment "\!.*$"    contains=inpTodo
" ----------------------------------------------------------------

" ---------------------Hilight for variables-----------------------
syn match   inpVariant  "c\d\+"
" -----------------------------------------------------------------

" ---------------------Hilight for Number-------------------------
syn match   inpNumber   "\<0[o0]\=\o\+[Ll]\=\>"
syn match   inpNumber   "\<0[xX]\x\+[Ll]\=\>"
syn match   inpNumber   "\<0[bB][01]\+[Ll]\=\>"
syn match   inpNumber   "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   inpNumber   "\<\d\+[jJ]\>"
syn match   inpNumber   "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   inpNumber 
                      \ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   inpNumber 
                      \ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
" ---------------------------------------------------------------

" ---------------------Hilight for Keywords-------------------------
syn keyword inpKeyword proton photon neutron electron all
" ------------------------------------------------------------------

" ---------------------Hilight Links-------------------------
hi def link inpComment  Comment
hi def link inpSection  Statement
hi def link inpTodo     Todo
hi def link inpOff      Todo
hi def link inpNumber   Number
hi def link inpCell     Number
hi def link inpKeyword  Special
hi def link inpVariant  Type
" ----------------------------------------------------------

let b:current_syntax = "inp"
