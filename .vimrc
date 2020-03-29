set runtimepath^="${HOME}/vimrc"
if (&term == "xterm" || &term == "xterm-256color")
    let &t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
endif

source ~/vimrc/basic.vim
source ~/vimrc/filetypes.vim
source ~/vimrc/plugins.vim
source ~/vimrc/extended.vim

try
  source ~/vimrc/custom_config.vim
catch
endtry
