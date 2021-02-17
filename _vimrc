" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set lines=40 columns=120
set splitright
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
set guioptions-=e
set nolist
set number
set nocompatible
syntax on
set showmode
set mouse=a
set showcmd
set t_Co=256
filetype indent on
set autoindent
set expandtab
set softtabstop=2
set cursorline
set textwidth=80
set nowrap
set scrolloff=4
set laststatus=2
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set undofile
set autochdir
set history=1000
set autoread
set wildmenu
set wildmode=longest:list,full
set virtualedit=block,onemore
set confirm
set autowrite
let mapleader = "`"
nnoremap <c-c> yy
nnoremap <c-d> yyp
nnoremap <c-v> p
nnoremap <c-z> u
nnoremap <leader>e :e D:\Program Files\Vim\_vimrc<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" vim插件配置
" vim-plug
" ******************************BEGIN******************************
call plug#begin('~/.vim/plugged')
"中文vim入门，不需要可注释掉
Plug 'yianwillis/vimcdoc'
"vim-colorschemes
Plug 'flazz/vim-colorschemes'
"change scheme
Plug 'chxuan/change-colorscheme'

"incsearch
Plug 'haya14busa/incsearch.vim'
"强化f/t
Plug 'rhysd/clever-f.vim'

"vim-airline
"Plug 'vim-airline/vim-airline'
"vim-airline themes
"Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
"nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"vim-easymotion
Plug 'easymotion/vim-easymotion'

"vim auto pair
Plug 'jiangmiao/auto-pairs'

"vim-smooth_scroll
Plug 'terryma/vim-smooth-scroll'

"vim-surround
Plug 'tpope/vim-surround'

"vim-commentary
Plug 'tpope/vim-commentary'

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'

"vim expand region
Plug 'terryma/vim-expand-region'

"tarbar
Plug 'majutsushi/tagbar'

"vim-endwise
Plug 'tpope/vim-endwise'

"vim start page
"Plug 'mhinz/vim-startify'

"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf'}

"根据缩进折叠代码
"Plug 'tmhedberg/SimpylFold'

"文本搜索rg
Plug 'mileszs/ack.vim'

"彩虹括号增强
Plug 'luochen1990/rainbow'

"对齐插件
Plug 'godlygeek/tabular'

"语法检查
Plug 'vim-syntastic/syntastic'

"复制增强
Plug 'machakann/vim-highlightedyank'

"快速打开大文件
Plug 'vim-scripts/LargeFile'
call plug#end()
" ******************************END******************************

" VimPlug快捷键：安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

"vim-colorschemes
"默认主题
colorscheme desert
"change-colorscheme
nnoremap <silent> <F9> :PreviousColorScheme<cr>
inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
nnoremap <silent> <F10> :NextColorScheme<cr>
inoremap <silent> <F10> <esc> :NextColorScheme<cr>
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>


"incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"使用<Esc><Esc>暂时关闭高亮功能
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
"使用Ctrl+k统计匹配个数
nnoremap <silent> <C-k> :%s///gn<CR>


"f/t增强
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
map ; <Plug>(clever-f-repeat-forward)
map ' <Plug>(clever-f-repeat-back)

"nerdtree
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open nerdtree automatically when vim starts with a dictory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"快捷键
map <leader>n :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'

"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "?",
            \ "Staged"    : "?",
            \ "Untracked" : "?",
            \ "Renamed"   : "?",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "?",
            \ "Dirty"     : "?",
            \ "Clean"     : "??",
            \ 'Ignored'   : '?',
            \ "Unknown"   : "?"
            \ }

"vim-easymotion
let g:EasyMotion_smartcase=1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)
map <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>j <Plug>(easymotion-bd-jk)
nmap <Leader>j <Plug>(easymotion-overwin-line)

" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Multip Cursor
" Default key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-y>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"expand region expand
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
            \ 'iw'  :0,
            \ 'iW'  :0,
            \ 'i"'  :0,
            \ 'i''' :0,
            \ 'i]'  :1,
            \ 'ib'  :1,
            \ 'iB'  :1,
            \ 'il'  :0,
            \ 'ip'  :1,
            \ 'ie'  :0,
            \ }"

"tarbar
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>
inoremap <silent> <leader>t <esc> :TagbarToggle<cr>

"fzf settings
nnoremap <Tab> :FZF <cr>
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val  }'))
    copen
    cc
endfunction
let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }
"Default fzf layout
let g:fzf_layout = { 'down': '~40%'  }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
"代码折叠
set foldmethod=indent
let g:SimpylFold_docstring_preview=1

"Ack和rg
let g:ackprg = 'rg '
nnoremap <C-s> :Ack<space>

"彩虹括号增强
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" 复制增强
let g:highlightedyank_highlight_duration = 1000
let g:highlightedyank_highlight_duration = -1

"设置字体 fonts
set guifont=Hack:h11
