" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

"scriptencoding utf-8
"set encoding=utf-8
"set list listchars=tab:\>\ ,eol:-

"PATHOGEN
filetype off

"NERDTree

"STATUSLINE
let g:mode = 0
colorscheme wiltz
set laststatus=2
set statusline=
set hlsearch

function! DrawStatus(mode)
	if &readonly
		set statusline+=%#statusReadOnly#
		set statusline+=Caution:\ READONLY
	endif
	set statusline+=\ %m
	set statusline+=\ [%p%%]
	set statusline+=%=
	set statusline+=%#statusLocation#
	set statusline+=[%3c:%4l/%-4L]
endfunction

function! ToInsert()
	let g:mode = 1
	set statusline=
	set statusline+=%#statusInsertFile#
	set statusline+=%F\ | 
	set statusline+=%#statusInsert#
	call DrawStatus(1)
endfunction

function! FromInsert()
	let g:mode = 0
	set statusline=
	set statusline+=%#statusNormalFile#
	set statusline+=%F\ |
	set statusline+=%#statusNormal#
	call DrawStatus(0)
endfunction

au InsertEnter * call ToInsert()
au InsertLeave * call FromInsert()

set statusline+=%#statusNormalFile#
set statusline+=%F\ |
set statusline+=%#statusNormal#
call DrawStatus(0)
	
"set statusline+=%#statusInsert#
"set statusline+=%F

set nocompatible
set clipboard=unnamedplus 
set t_co=256
syntax on
set number
set autoindent
set smartindent
set relativenumber
set ruler	" Line number and cursor pos
set cindent
set cursorline
set nolist
filetype plugin indent on
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++ -stdlib=sdl2'
let type = &ft
echon type


set incsearch
set showmode

autocmd BufNewFile,BufRead *.hs set expandtab
autocmd BufNewFile,BufRead *.hs set shiftwidth=4
autocmd BufNewFile,BufRead *.hs set tabstop=4

command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tab size: ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:sw = l:tabstop
		let &l:ts = l:tabstop
	else
		echon 'ERROR - Tab size must be > 0'
	endif
endfunc

command! -nargs=* Wrap set wrap linebreak
command! -nargs=* Unwrap call Unwrap()
function! Unwrap()
	set wrap
	set linebreak!
	set nolist!
endfunc

"Simple Shortcuts
nmap <C-S-N> :NERDTreeToggle<CR>
nmap <C-S-R> :set relativenumber!<CR>

"Format block
nmap <F1> =i}
"Fold block
nmap <NUL> ^v]}zf
"Insert row
nmap <C-O> o<Esc>
"Delete Line
nmap <C-D> S<Esc>0i<BS><Esc>
"Move line up/down
nmap <C-S-K> ddkkp
vmap <C-S-J> :m '>+1<CR>gv=gv
vmap <C-S-K> :m '<-2<CR>gv=gv
"Selecting a block
nmap <C-S-B> j]}v[{k

"nmap <F2> ^i//<ESC>
"nmap <F3> 0/\/\/<CR><DEL><DEL> 

map <F2> :call Comment()<CR>
imap <F2> <ESC>:call Comment()<CR>i
map <C-U> :call Comment()<CR>j
imap <C-U> :call Comment()<CR>

"vmap <C-C> "+yi
vnoremap <C-C> :w !xsel -b<CR><CR>

imap <F3> <C-X><C-U>

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'),col('.')), 'synIDattr(v:val, "name")')
endfunc

function! Comment()
	let line = getline('.')
	let linenumber = line('.')
	let type = &ft
	let comment = "//"
	let len = 2
	if type == "vim"
		let comment = "\""
		let len = 1
	elseif type == "haskell"
		let comment = "--"
		let len = 2
	elseif type == "xdefaults"
		let comment = "!"
		let len = 1
	elseif type == "zsh"
		let comment = "#"
		let len = 1
	elseif type == "sh"
		let comment = "#"
		let len = 1
	elseif type == "conf"
		let comment = "#"
		let len = 1
	elseif type == "python"
		let comment = "#"
		let len = 1
	endif
	
	let pos = match(line,comment)
	let n = 0

	while n < 100
		if line[n] != ' ' && line[n] != '\t'
			break
		endif
	
		let n = n + 1
	endwhile

	if n == pos && pos != -1
		let line = strpart(line,0,pos).strpart(line,pos+len)
	else
		let line = comment.line
"		let line = strpart(line,0,n).(comment.strpart(line,n))
	endif

	let err = setline(linenumber,line)
endfunction
" This doesn't work.
function! Init()
	let num = line('.')
	let line = getline('.')
"	let err = setline(num,line)
	let type = &ft
	let line = line.type
	if type == "haskell"
"		let line = getline('.')
"		let line = line."THIS IS HASKELL"
		set expandtab
	endif
endfunction

":call Init()
"PLUGINS
