function! yapi#Fetch() abort
  let tmpfile = tempname() . ".yml"
  call writefile(getline(1, "$"), tmpfile)
  let resp = system("yapi " . tmpfile . ":" . line("."))
  if g:yapi_populate_location_list == 1
    let locs = map(split(resp, "\n"), {_, line -> {'text': line}})
    call setloclist(0, locs)
  endif
  call delete(tmpfile)
  echo resp
endfunction
