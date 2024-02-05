" vim-plug configuration
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' " Markdown plugin
Plug 'suan/vim-instant-markdown', {'for':'markdown'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
call plug#end()

" Plugin configurations
" ...
" vim-instant-markdown config to run server and remap stop
" Map leader+m to start Instant Markdown Preview
nmap <Leader>im :InstantMarkdownPreview<CR>
" Map leader+x to stop Instant Markdown Preview
nmap <Leader>ims :InstantMarkdownStop<CR>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1

" ...
" Fugitive Git integration
autocmd FileType git commit,gitconfig,gitrebase,gitcommit set spell

" Use a dark color scheme
set background=dark
" Enable line numbers
set number
" Enable syntax highlighting
syntax enable
" Enable filetype detection, loading of plugins and auto identation
filetype plugin indent on 
set foldmethod=syntax

" Install Vim-Plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Enable folding for Markdown
autocmd FileType markdown setlocal foldexpr=MarkdownFolds()
" Set markdown file type
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" Configure markdown plugin
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1

inoremap jj <Esc> 
" Use Ctrl+j to jump out of UltiSnips placeholders
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-R>=UltiSnips#ExpandSnippet()\<CR>"

