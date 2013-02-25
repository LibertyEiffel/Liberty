" Language:	SmartEiffel
" Author:	Jérémie Delaitre <jeremie.delaitre@gmail.com>
"
" Define the "SEe" command which edit the file corresponding to the given
" class name. The "se find" command is used to get the correct file path.
" e.g.: ":SEe string"
"
" HOWTO :
" 1: Copy this file as : ~/.vim/ftplugin/eiffel.vim
" 2: Change the 'bin_dir' variable to point to the directory where SE binaries are.
" 3: Edit an eiffel file to get the "SEe" command define (because the vim script is parsed when an eiffel file is edited).

if exists(":SEe") == 2
  finish
endif

fun GetSEFile(class_name)
  " Set the path in which SmartEiffel binaries are.
  let bin_dir = $HOME . "/SmartEiffel/bin/"
  
  let file_path = substitute(system(bin_dir . "se find " . a:class_name), "(.*", "", "")
  return file_path
endfun

command -nargs=1 SEe execute "edit " . GetSEFile(<f-args>)

