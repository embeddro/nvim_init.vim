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
Plug 'voldikss/vim-floaterm' "Терминал в vim"
Plug 'chrisbra/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " скобки вокруг 
Plug 'rafi/awesome-vim-colorschemes' "темы 
Plug 'vim-airline/vim-airline' "строка статуса 
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
nnoremap <C-T> :FloatermToggle<CR>

" Закоментировать выделение"
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

"---настройка отступов при коментах в yaml файлах---"
autocmd FileType yaml setlocal indentkeys-=0#

" Цветовая тема
syntax enable
set background=dark
colorscheme tender

" Системный буфер обмена добавить пакет vim-gtk3
noremap <Leader>y "+y 
noremap <Leader>p "+p

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

