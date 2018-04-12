set encoding=utf-8
set nu

execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
syntax enable
set background=dark
colorscheme solarized

let g:ycm_autoclose_preview_window_after_completion=1
map <leader> g:YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$'  ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_flake8_args='--ignore=E501'

let python_highlight_all=1
syntax on

set clipboard=unnamed

let g:ctrlp_map = '<c-p>'  
let g:ctrlp_cmd = 'CtrlP'  
  
let g:ctrlp_working_path_mode = 'ra'  
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']    
  
let g:ctrlp_switch_buffer = 'et'    
  
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux    
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows    
    
    
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'    
let g:ctrlp_custom_ignore = {    
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',    
  \ 'file': '\v\.(exe|so|dll)$',    
  \ 'link': 'some_bad_symbolic_links',    
  \ }    
    
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux    
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] 

let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

nmap <F2> :NERDTreeToggle<CR> 
nnoremap <silent><F7> :SyntasticCheck<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

nnoremap <C-x> :w <CR> :tabclose<CR>  
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction
