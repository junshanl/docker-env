set encoding=utf-8
set nu

execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
syntax enable
set background=dark
colorscheme solarized

set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

map <leader> g:YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader> d:YcmCompleter GetDoc<CR> 
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_python_binary_path = 'python'

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
let g:asyncrun_rootmarks = ['.gitignore', '.svn', '.git', '.root', '.bzr', '_darcs', 'build.xml'] 

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
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(9, 1)
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
