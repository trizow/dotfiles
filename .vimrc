set runtimepath^="${HOME}/.vim_go_runtime"

source ${HOME}/.vim_go_runtime/vimrc/basic.vim
source ${HOME}/.vim_go_runtime/vimrc/filetypes.vim
source ${HOME}/.vim_go_runtime/vimrc/plugins.vim
source ${HOME}/.vim_go_runtime/vimrc/extended.vim
source ${HOME}/.vim_go_runtime/bundle/forked/theme-foursee/colors/foursee.vim

try
  source ${HOME}/.vim_go_runtime/custom_config.vim
catch
endtry
