let scrollstep = 70

" alias ':g' to ':tabnew google'
command g tabnew google

site '*://*github.com/*' {
  unmap t
}

site '*://*.google.com/*' {
  unmap j
  unmap k
}
