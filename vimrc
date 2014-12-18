" .vimrc for Liu Shaohui(lshmouse@gmail.com)
" version 0.1
" 1. using vundle to install plugins automatically
" 2. common plugins: a.vim bufexplorer winmanager, lookupfile and so on 
"
" version 0.2
" 1, support golang
"
" See: http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" See: http://tonybai.com/2014/11/07/golang-development-environment-for-vim/

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

call vundle#begin()
Bundle 'gmarik/vundle'

" See: http://stackoverflow.com/questions/8804767/e185-cannot-find-color-scheme-solarized
Bundle 'pathogen.vim'
source ~/.vim/bundle/pathogen.vim/autoload/pathogen.vim
call pathogen#infect()

"Add your bundles here
"Search in http://vim-scripts.org/vim/scripts.html
"Or just add github project url
Bundle 'rodnaph/vim-color-schemes'
color adrian

Bundle 'ku-quickfix'
Bundle 'genutils'
" Bundle 'The-NERD-Commenter'

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

Bundle 'https://github.com/yegappan/mru'
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

Bundle 'bufexplorer.zip'
nmap  <F6> :BufExplorer<cr>

" Bundle 'minibufexpl.vim'
" nmap  <F6> :buffers<cr>
" let g:miniBufExplMapWindowNavVim = 1 
" let g:miniBufExplMapWindowNavArrows = 1 
" let g:miniBufExplMapCTabSwitchBufs = 1 
" let g:miniBufExplModSelTarget = 1
" let g:bufExplorerMaxHeight=30
" let g:miniBufExplorerMoreThanOne=0
" nmap <leader>bn :bn<cr>
" nmap <leader>bp :bp<cr>

Bundle 'a.vim'
" a.vim setting
nmap  <F7> :A<cr>

Bundle 'SuperTab'

" vim for golang
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" vim-go settings
let g:go_fmt_command = "goimports"

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_key_invoke_completion = '<C-Space>'

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" All of your Plugins must be added before the following line
call vundle#end()            " required

"...All your other bundles...
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

""""" common config 

" set mapleader
let mapleader = ","

syntax on
" encoding
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set nocompatible
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
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

set hlsearch incsearch
set colorcolumn=+1
set textwidth=100
set foldenable
set foldmethod=indent

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
