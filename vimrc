" leaderkey is <,>
let mapleader = ","

" Настройки табуляции
retab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab " Пробелы вместо <Tab>
set autoindent " копирует отступы с текущей строки при добавлении новой
set smartindent

filetype on
filetype plugin indent on
set nobackup
set title
set encoding=utf-8
set visualbell
set fileformat=unix
set t_Co=256
set autochdir
set number

" vim-plug manager plagins
call plug#begin()
Plug 'preservim/NERDTree', {'on':'NERDTreeToggle'}
Plug 'airblade/vim-gitgutter', {'on':'GitGutterEnable'}
Plug 'tpope/vim-fugitive' "Для работы с Git 
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm' "Терминал в vim
Plug 'chrisbra/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " скобки вокруг 
Plug 'rafi/awesome-vim-colorschemes' "темы 
Plug 'vim-airline/vim-airline' "строка статуса 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Просмотр md 
Plug 'tibabit/vim-templates' "добавление темплейтов должны лежать в папке плагина
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips' "движек сниппетов
Plug 'honza/vim-snippets' "Набор готовых сниппетов https://github.com/honza/vim-snippets/tree/master/snippets
Plug 'sheerun/vim-polyglot' "Подсветка синтаксиса для всего
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Плагин для установки быстрого поиска
Plug 'junegunn/fzf.vim' "Плагин для быстрого поиска
call plug#end()


"---Перемещение по табам---"
noremap tn :tabnew <CR> "Новая вкладка"
noremap tc :tabclose <CR> "Закрыть вкладку"
noremap th :tabprevious <CR> "Предыдущая вкладка"
noremap tl :tabnext <CR> "Следующая вкладка"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt


" indentLine настройки "
nnoremap <C-i> :IndentLinesToggle<CR> "Переключение отображения отступов

" Быстрые клавиши для NERDTree
nnoremap <C-n> :NERDTreeToggle<CR> "Открыть/закрыть NERDTree - Ctrl+n

" GitGutter переключатель 
nnoremap <C-g> :GitGutterEnable<CR> "Открыть/закрыть GitGutter - Ctrl+g

" Открыть закрыть терминал в vim"
nnoremap <silent> <C-T> :FloatermToggle<CR>
tnoremap <silent> <C-T>  <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_keymap_toggle = '<F12>'

" Закоментировать выделенный фрагмент"
map <C-_> gc

" Перемещение по окнам
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>v <C-w>v " Вертикальное разбиение
map <leader>q <C-w>q " Выход из окна
map <leader>s <C-w>s " Горизонтальное разбиение

"---навигация на русской раскладке---"
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d
nmap щ o
nmap ц w
nmap и b
nmap И B
nmap к r
nmap вв dd

"---выход из режима вставки ii--- "
inoremap ii <ESC>
inoremap шш <ESC>

" Setting snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"---настройка отступов при коментах в yaml файлах---"
autocmd FileType yaml setlocal indentkeys-=0#

" Цветовая тема
syntax enable
set background=dark
colorscheme tender

" Системный буфер обмена добавить пакет vim-gtk3
noremap <Leader>y "+y  "Копировать в системный буфер обмена
noremap <Leader>p "+p  "Вставить из системного буфера

" Настойки для vim-template
let g:tmpl_author_name = 'Aleksey Prusakov'
let g:tmpl_author_email= 'devops.76.pf@gmail.com'
let g:tmpl_company     = 'PizzaFabrika'
let g:tmpl_project     = '911'

"vim-repeat support
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" добавление название ветки в lightline plugin
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Spell Check  F2 - toggle language
let b:myLang=0
let g:myLangList=["nospell","ru_ru,en_gb","en_gb","ru_ru"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F2> :call ToggleSpell()<CR>
