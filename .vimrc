set nu
set ai
set cindent
set title
set omnifunc=htmlcomplete#CompleteTags

set laststatus=2
set statusline=%F
hi StatusLine cterm=None ctermbg=34 ctermfg=233

"convert tab to whitespace
set expandtab
set tabstop=4
set shiftwidth=4

"auto complete
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>

"HTML tag autocomplete
inoremap <C-g> </><LEFT>

"display invisiable characters
set list
set listchars=tab:▹▹,eol:↵,trail:▯,extends:>
hi SpecialKey ctermfg=240
hi NonText ctermfg=240

set showmatch
hi MatchParen ctermbg=21 

hi String ctermfg=228

"highlight cursorline
set cursorline
hi CursorLine cterm=None ctermbg=17
hi LineNr ctermbg=237

set conceallevel=2
set concealcursor=niv
hi Conceal ctermfg=243 ctermbg=239

"display and highlight indent
function! DisplayIndentHi()
    syn match IndentSpace /^\s\+/ contains=IndentShift
    syn match IndentShift /\s\{4}/hs=e contained
    hi IndentShift ctermfg=9 ctermbg=239
endf
autocmd BufNewFile,BufRead,BufNew,BufWinEnter * call DisplayIndentHi()

"Python syntax highligth
function! PythonStringHi()
    syn match PythonString /["'].\*["']/ skipwhite
    syn region PythonDict start=/{\s\?/ end=/\s\?}/ contains=PythonDictKey
    syn match PythonDictKey /["']\w\+["']\s\?:/he=e-1 skipwhite contained
    syn region PythonDoc start=/"""/ end=/"""/ skipwhite
    syn match PythonSelf /self.\S\+/
    syn match PythonArgs /(\D\+):\n/ contains=Arguments
    syn region Arguments start=/(/hs=s+1 end=/)/he=e-1 skipwhite contained

    hi link PythonString String
    hi PythonDictKey ctermfg=203
    hi PythonSelf ctermfg=119
    hi Arguments ctermfg=215
    hi pythonStatement ctermfg=177
    hi link pythonConditional pythonStatement
    hi link pythonRepeat pythonStatement
    hi pythonOperator ctermfg=197
    hi pythonComment ctermfg=244
    hi pythonNumber ctermfg=15
    hi pythonFunction ctermfg=33
    hi link PythonDoc pythonComment
endf
autocmd BufNewFile,BufNew,BufRead *.py call PythonStringHi()

"HTML syntax highlight
function! HTMLHi()
    hi htmlTag ctermfg=15
    hi link htmlEndTag htmlTag
    hi htmlTagName ctermfg=197
    hi link htmlSpecialTagName htmlTagName
    hi htmlComment ctermfg=245
endf
autocmd BUfNewFile,BufNew,BufRead *.html call HTMLHi()

"YAML syntax highlight
function! YamlHi()
    syn match KeyString /\h\+:/he=e-1
    hi KeyString ctermfg=39
endf
autocmd BufNewFile,BufNew,BufRead *.yml call YamlHi()
