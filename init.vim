" ДОСТУП К НАСТРОЙКАМ УСТАНОВЛЕННЫХ ПЛАГИНОВ ПОСЛЕ СТРОКИ call plug#end()
"

" Отображение номера строки
set number
" Отображать имя и путь к файлу сверху
set title
" Подсвечивать курсор 
set cursorline
" Отображение линейки внизу (на кокой строке и сколько расстояние до др. строк
set ruler 

" Установка улучшенного цвета
set t_Co=256

" Комбинация клавиш ii выход из режима вставки 
inoremap ii <ESC>

" Делаем работающую навигацию на русском языке тест 
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d
nmap щ o
nmap Щ O
nmap ц w
nmap и b
nmap И B
nmap к r

" Terminal Mode
" Use escape to go back to normal mode
"tnoremap <Esc> <C-\><C-n>


" Добавляем плагины с помощью vim-plug. vim-plug должен быть установлен:
" Для NeoVim:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"Команды:
" :PlugStatus - статус текущих плагинов
" :PlugInstall - установка плагинов
" :PlugUpgrade - обновление vim-plug
" :PlugUpdate - обновление плагинов
" :PlugClean - удаление ненужных плагинов
call plug#begin()
	" FuzzyFinder (для быстрого поиска)
	"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	"Plug 'junegunn/fzf.vim'
	
	" NERDTree - быстрый просмотр файлов
	Plug 'preservim/nerdtree'

	" Дополнения для NERDTree
	"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	"Plug 'scrooloose/nerdcommenter'
	
	" Сoc - автодополнение 
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	" Дополнение для Git, а также иконки для NERDTree
	"Plug 'airblade/vim-gitgutter'
	"Plug 'ryanoasis/vim-devicons'
	
	" Линия статуса
	Plug 'itchyny/lightline.vim'

	" Темы
	"Plug 'joshdick/onedark.vim'
	Plug 'cocopon/iceberg.vim'

	" Проверка Синтаксиса
	"Plug 'scrooloose/syntastic' 
	
	" Плагин автозавершения
	Plug 'Valloric/YouCompleteMe'

	" Плагин автозавершения
	Plug 'cespare/vim-toml'
	
	" Поддержка Python
	"Plug 'klen/python-mode'
	
	" Ассинхроннный make
	"Plug 'neomake/neomake', { 'for': ['rust'] }
	
call plug#end()


" Быстрые клавиши для NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>  " Открыть/Закрыть NERDTree - Ctrl+n
nnoremap <C-f> :NERDTreeFind<CR>    " Поиск файла - Ctrl+f

"Закрыть NVim если осталась только вкладка NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Для установки YouCompleteMe требуется:
" sudo apt-get install build-essential cmake python-dev python3-dev
" после запустить YouCompleteMe/install.py --racer-completer
" Быстрые клавиши для YouCompleteMe:
nnoremap <Leader>] :YcmCompleter GoTo<CR> " \+] - переход к определению

" Тема для **NeoVim**
syntax on 
colorscheme iceberg

" Перемещение по окнам через Ctrl+jkhl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-v> <C-W>v " Вертикальное разбиение Ctrl+v
map <C-q> <C-W>q " Выход из окна Ctrl+q
map <C-s> <C-W>s " Горизонтальное разбиение Ctrl+s


" Перемещение по Табам
nnoremap tn  :tabnew <CR> " Новая вкладка
nnoremap tc  :tabclose <CR> " Закрыть вкладку
nnoremap tj  :tabclose <CR> " Закрыть вкладку
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt

nnoremap <F5> :!cargo run<CR>
nnoremap <F6> :!cargo test<CR>
nnoremap <F7> :!cargo clean<CR>

"закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>

"автозакрытие кавычек
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Автоматически меняет текущую дирректорию на дирректорию открытого файла
set autochdir
