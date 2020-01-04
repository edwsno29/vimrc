" system clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else   " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif 

" Remapping Y in vim
nmap Y y$

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" set tab to 2 space in specific file(https://stackoverflow.com/questions/54872662/vim-tab-indentation-for-tex-document)
au BufRead,BufNewFile *.vue,*.js,*.md,*.html,*.sass,*.scss,*.css setlocal shiftwidth=2 softtabstop=2 tabstop=2

" python provider when :checkheath in nvim
if has('nvim')
    let g:python3_host_prog='/usr/bin/python3'
    " let g:python2_host_prog='/usr/bin/python2'
endif

" set <M-P> = ^[P   " rotate yanks backward

" from https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" let g:ycm_python_binary_path = '/home/ksxubu/ScrapyVirtualEnvPython3/bin/python3'
" debug YouCompleteMe
" let g:ycm_server_keep_logfiles=1
" let g:ycm_server_log_level='debug'

" Maximize or set initial window size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
endif

" time RFC822 format:
iab cdate <c-r>=strftime("%c")<cr>

" line wrap: stop line breaking in vim
set nowrap

"  Change Colors #12(https://github.com/amix/vimrc/issues/12)
try
    if has('gui_running')
        set background=dark
        colorscheme solarized
    " else
    "   default peaksea colorscheme
    endif
catch
endtry
