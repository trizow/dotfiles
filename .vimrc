set runtimepath^="$(HOME)/.vim_go_runtime"
if (&term == "xterm" || &term == "xterm-256color")
    let &t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
endif

source ~/.vim_go_runtime/vimrc/basic.vim
source ~/.vim_go_runtime/vimrc/filetypes.vim
source ~/.vim_go_runtime/vimrc/plugins.vim
source ~/.vim_go_runtime/vimrc/extended.vim

try
  source ~/.vim_go_runtime/custom_config.vim
catch
endtry
