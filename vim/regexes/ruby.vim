"
" vim/regexes/ruby.vim
" Vim regexes to help with ruby files
"

" Regex for converting the quotes from double to single
%s/"/'/g

" Regex for converting all occurrences of Ruby 1.8 hash syntax to 1.9
 %s/:\([^=,'"]*\) =>/\1:/g
