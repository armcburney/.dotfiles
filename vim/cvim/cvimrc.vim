let scrollstep = 70
let completionengines = ['google', 'youtube']

" alias ':g' to ':tabnew google'
command g tabnew google

site '*://*github.com/*' {
  unmap t
}
