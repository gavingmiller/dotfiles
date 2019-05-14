""""""""""""""""""""""""""""""""""""""""""""""""
" Gavin's New Vimrc
" Adapted from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" tell it to use an undo file
set undodir=.undo
set undodir+=~/.vimtmp
set undofile
set undolevels=10000

" if available use relative numbers for line numbering
if exists("&relativenumber")
  set relativenumber
else
  set number
endif

" color the 110th column
if exists('+colorcolumn')
  set colorcolumn=110
endif

" allow unsaved background buffers and remember marks/undo for them
set hidden

" remember more commands and search history
" TODO not sure how to use this so commented out for now
" set history=10000

set expandtab
" TODO update to 4?
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set cursorline
set cmdheight=2
" TODO no idea what this does
"set switchbuf=useopen
set numberwidth=5
" TODO no idea what this does
" set showtabline=2
set winwidth=79
set shell=bash

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Remove backup and swap files
set nobackup
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" enable highlighting of syntax
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" use emacs-style tab completion when selecting files, etc.
set wildmode=longest,list

" make tab completion for files/buffers act like bash
set wildmenu
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=110

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " for wkhtmltopdf templates ending in .pdf.erb we still want eruby and
  " html syntax highlighting and indent rules
  autocmd BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'|set filetype=eruby

  " for bash -- couldn't figure out how to detect bash but this works for now
  autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab

  " for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType markdown,ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  " detect md as markdown
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " *.pdf.erb files don't have html_indent_tags defined
  if exists("g:html_indent_tags")
    " Indent p tags
    autocmd FileType html,eruby
          \ if g:html_indent_tags !~ '\\|p\>' |
          \ let g:html_indent_tags .= '\|p\|li\|dt\|dd' |
          \ endif
  endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
" Additional colors can be found at: http://vimcolors.com/
""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:set background=dark
:color railscasts

""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

" Insert a hash rocket with <ctrl-l> in insert mode
imap <c-l> <space>=><space>

" Insert a binding.pry
imap <leader>bp require 'pry'; binding.pry

" " Can't be bothered to understand ESC vs <c-c> in insert mode
" imap <c-c> <esc>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO figure out how to use
"cnoremap %% <C-R>=expand('%:h').'/'<cr>
"map <leader>e :edit %%
"map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC CtrlP TARGETS AND FILES
" Docs https://github.com/ctrlpvim/ctrlp.vim#basic-usage
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

" <F5> is used to purge cache and reload CtrlP. Don't add into shortcuts,
" otherwise refresh will cause slowdown in large projects
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>f :CtrlP<cr>
map <leader>F :CtrlP<cr>

" directories to ignore
set wildignore+=*/build/*,*/tmp/*

" rails
set wildignore+=vendor/**,public/**,coverage/**,app/assets/**,app/assets/**,node_modules/**,private_gems/**,client-src/**,log/**

" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>T :call RunTestFile()<cr>
map <leader>t :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif
    !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function!  RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color --format documentation " . a:filename
    else
      exec ":!rspec --color --format documentation " . a:filename
    end
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STRIP TRAILING WHITESPACE
" From http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE
""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nt :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$']

""""""""""""""""""""""""""""""""""""""""""""""""
" PROJECT SPECIFIC
""""""""""""""""""""""""""""""""""""""""""""""""

" command-t ignores for cisco (move to private file if sensitive information required)
set wildignore+=bundled_gems/**
set wildignore+=build/**

" Syntax highlighting for haproxy
au BufRead,BufNewFile haproxy* set ft=haproxy
