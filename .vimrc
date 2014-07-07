" .vimrc for Liu Shaohui(lshmouse@gmail.com)
" version 0.1
" 1. using vundle to install plugins automatically
" 2. common plugins: a.vim bufexplorer winmanager, lookupfile and so on
" version 0.2
" 1, support golang

" see: http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Add your bundles here
"Search in http://vim-scripts.org/vim/scripts.html
"Or just add github project url
Bundle 'https://github.com/rodnaph/vim-color-schemes' 
color adrian

Bundle 'ku-quickfix'
Bundle 'genutils'

" Bundle 'winmanager'
" using winmanager to manage windows

Bundle 'taglist.vim'
" taglist.vim
nmap  <F2> :TlistToggle<cr>
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1

Bundle 'scrooloose/nerdtree'
" nerdtree.vim
nmap  <F3> :NERDTreeToggle<cr>
let g:nerdtreewinpos="left"
let g:nerdtreewinsize=25
let g:nerdtreeshowlinenumbers=1
let g:nerdtreequitonopen=1

Bundle 'mru.vim'
" mru.vim setting
nmap  <F4> :MRU<cr>

Bundle 'lookupfile'
" LookupFile setting
nmap  <F5> <Plug>LookupFile<cr>
let g:LookupFile_TagExpr='"tags.fn"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0

" Bundle 'bufexplorer.zip'
" nmap  <F6> :BufExplorer<cr>
Bundle 'minibufexpl.vim'
nmap  <F6> :buffers<cr>
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:bufExplorerMaxHeight=30
let g:miniBufExplorerMoreThanOne=0
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>

Bundle 'a.vim'
" a.vim setting
nmap  <F7> :A<cr>

Bundle 'snipMate'
" snipMate
let g:snips_author="Liu Shaohui"
let g:snips_email="lshmouse@gmail.com"
let g:snips_copyright="XiaoMi, Inc"

Bundle 'SuperTab'

" Bundle 'https://github.com/Shougo/neocomplete.vim'
" g:neocomplete#enable_at_startup = 1
" Bundle 'https://github.com/Valloric/YouCompleteMe' 

" vim for golang
" Bundle 'https://github.com/fatih/vim-go'
" Bundle 'https://github.com/tomasr/molokai'
" Bundle 'https://github.com/Shougo/neosnippet.vim'
" Bundle 'https://github.com/majutsushi/tagbar' 
" Bundle 'https://github.com/fsouza/go.vim'

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

" common config
syntax on
" encoding
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set nocompatible
set nocp
set ignorecase autoread number cursorline showmatch
set laststatus=2
set backspace=2
set autoindent cindent smartindent
set nobackup noswapfile
set history=1000
set laststatus=2
set cmdheight=2
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
" using mouse
set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

set hlsearch incsearch
set colorcolumn=+1
set textwidth=100
set foldmethod=syntax
set nofoldenable

filetype off
filetype plugin indent on

set completeopt=preview,menu,longest
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

" nmap
" nmap <F9>  :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
" nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
" nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
