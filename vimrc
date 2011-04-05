" Configure vim to suck less
" Author: ZeusTheTrueGod
"

filetype off
call pathogen#runtime_append_all_bundles()

" Fix vim defaults 
set nocompatible
set lazyredraw
set ttyfast
set backspace=indent,eol,start 	" backspace works as expected
set nostartofline 		        " Make j/k respect the columns (after all, this is not a freaking typewriter) 
set modeline 			        " Respect modeline of the file (the famous "vi:noai:sw=3 ts=6" on the beginning of the files)
set hidden 			            " Avoid asking to save before hiding
set enc=utf-8
set nospell "I hate that stupid spell checking, it sucks, really!!!"

filetype on
filetype plugin on
filetype indent on

syntax on


" Basic UI 
set novisualbell
set shm=atIWswxrnmlf
set ruler
set title
set titlestring=%f%(\ [%M]%) 	" Show file name at the title
set numberwidth=1
set report=2
set laststatus=2 		
set statusline=%f
set showcmd
set showmode
set nu


"
" Bend vim features and behaviors to our wishes. 
"

"
" Command-mode completion
"
set wildmenu
set wildignore=*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp
set wildmode=list:longest

" Insert-mode completion
set complete=.,w,b,u,U,t,i,d

" Scrolling
set scroll=5
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" Matching
set showmatch
set matchpairs=(:),{:},[:],<:>

" Search and replace
set gdefault 		" Make regexp matches everything, instead of just the first one 
set incsearch 		" Search all instances
set hlsearch 		" Highlight matched regexp 
set ignorecase 		
set smartcase 		" Intelligent case-smart searching

"
" Indentation
"
set autoindent
set smartindent
set smarttab
set expandtab
set shiftround
set nojoinspaces
set nofoldenable
set tabstop=4
set softtabstop=4
set shiftwidth=4

"
" Autocomplete
"
set infercase
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete

"
" Soft/Hard Wrapping
"
set wrap
set textwidth=79
set formatoptions=qrn1

"
" History and backup
"
"set viminfo='10,:20,\"100,%,n~/.viminfo
set history=1000
set nobackup
set nowritebackup
set noswapfile

"
" Grep
"
set grepprg=ack
set grepformat=%f:%l:%m


" Enable vim-bundles

" Helper command to update bundles
function! s:UpdateBundles()
    exec '!ruby ~/.vim/bin/vim-update-bundles.rb'
endfunction
command! -nargs=? UpdateBundles call s:UpdateBundles()

"Colorscheme
" --- BUNDLE: https://github.com/godlygeek/csapprox.git
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme zenesque


" Syntastic 
" --- BUNDLE: http://github.com/scrooloose/syntastic.git
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Nerd Tree
" --- BUNDLE: git://github.com/scrooloose/nerdtree.git

"
" Nerd Commenter
" --- BUNDLEDENY: http://github.com/scrooloose/nerdcommenter.git

" Lusty explorer
" --- BUNDLE: git://github.com/sjbach/lusty.git

" Less annoying delimiters - DelimitMate
" --- BUNDLE: http://github.com/Raimondi/delimitMate.git
let delimitMate_smart_quotes = 1
let delimitMate_visual_leader = ""
let delimitMate_autoclose = 1

" snipMate 
" --- BUNDLE: http://github.com/msanders/snipmate.vim.git

" SuperTab
" --- BUNDLEDENY: http://github.com/ervandew/supertab.git
let g:SuperTabCrMapping = 0
"
" Matchit
" --- BUNDLE: http://github.com/edsono/vim-matchit.git

"
" vim-align 
" --- BUNDLE: http://github.com/tsaleh/vim-align.git

"
" Vim-Fugitive
" --- BUNDLE: http://github.com/tpope/vim-fugitive.git
set statusline+=%{fugitive#statusline()}

"Buffer
" --- BUNDLE: http://github.com/vim-scripts/L9.git
"
"Buffer
" --- BUNDLE: http://github.com/vim-scripts/FuzzyFinder.git 
"
"Buffer
" --- BUNDLE: http://github.com/vim-ruby/vim-ruby.git
"
" 
"Buffer
" --- BUNDLE: http://github.com/vim-scripts/Specky.git
""
let g:speckyBannerKey = "<LEADER>sb"
let g:speckyQuoteSwitherKey = "<LEADER>s'"
let g:speckyRunRdocKey = "<LEADER>sr"
let g:speckySpecSwitcherKey = "<LEADER>sx"
let g:speckyRunSpecKey = "<LEADER>ss"
let g:speckyRunSpecCmd = "bundle exec rspec "
let g:speckyRunRdocCmd = "bundle exec ri"
let g:speckyWindowType = 2
"Javascript lint
" --- BUNDLEX: http://github.com/hallettj/jslint.vim.git

"Javascript  indentation
" --- BUNDLE: https://github.com/pangloss/vim-javascript.git

"Javascript format
" --- BUNDLE: https://github.com/ZeusTheTrueGod/vim-format-js.git

"Colorscheme
" --- BUNDLE: https://github.com/vim-scripts/zenesque.vim.git

"Cucumber integration
" --- BUNDLE: https://github.com/tpope/vim-cucumber.git
"

" commandT
" --- BUNDLE: https://github.com/wincent/Command-T.git
"

"
" Filetypes
"
source ~/.vimrc-keymaps
if has("autocmd")

    " Save on focusLost
    autocmd FocusLost * :wa

    " Recognize 
    autocmd BufRead,BufNewFile *.json set filetype=json
    autocmd BufRead,BufNewFile *.less set filetype=less

    autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab 
    autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab 
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab 
    autocmd FileType json       setlocal ts=2 sts=2 sw=2 noexpandtab 

endif
if filereadable("vimrc")
    source vimrc
endif
