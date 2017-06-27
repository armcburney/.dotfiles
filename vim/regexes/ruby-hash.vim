"
" vim/regexes/ruby-hash.vim
" Regex for converting all occurrences of Ruby 1.8 hash syntax to 1.9
"

 %s/:\([^=,'"]*\) =>/\1:/g