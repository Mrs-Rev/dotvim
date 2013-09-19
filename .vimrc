" File: ~/.vimrc
" Modified: 2013 Sep 18
" 
" Maintainer: Kim Reverman <kim@tamu.edu>
"
" References: Vim Training - vimtutor
" References: vimrc manual - :help vimrc-intro
" References: :help usr_41.txt
" References: :help filetypes
" References: :help write-filetype-plugin
" References: filetype-indent-on
" References: pathogen vs vundle (Vundle good) 
" http://rmitc.org/2013/04/modern-vim-plugin-management-pathogen-vs-vundle/
" I did not like pathogen.
" References: www.vim.org
"

" --- evim { 
" When started as "evim", evim.vim will already have done basic settings.
if v:progname =~? "evim"
  finish
endif
" --- evim }

" Use Vim settings, rather then Vi settings (much better!).
" WARNING: This must be first, because it changes other options as a side effect.
set nocompatible

" --- Vundle {
"  Relaunch vim, run :BundleInstall to install the “bundles” you listed in
"  .vimrc. When you want to update them, :BundleUpdate. To remove a plugin,
"  just delete its line in your .vimrc file then relaunch vim and
"  run:BundleClean to remove its folder inside ~/.vim/bundle/
"
" Brief Vundle help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
filetype off		" required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle ... required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
"
" vim-scripts repos
Bundle 'php.vim'
"Bundle 'pythoncomplete'
"
" original repos on github
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos

" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...
"
filetype plugin indent on     " required!
" --- Vundle }
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use version control instead
set history=1000	" keep 50 lines of command line history
set undolevels=1000	" use many levels of undo
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" display the match for a search pattern when halfway typing it.
set title		" change the terminal title

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " :!ls $VIMRUNTIME/ftplugin/
  " :!cp $VIMRUNTIME/ftplugin/language.vim  ~/.vim/ftplugin/
  " :!ls ~/.vim/ftplugin/
  filetype plugin indent on
  setlocal omnifunc=syntaxcomplete#Complete

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!


  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
