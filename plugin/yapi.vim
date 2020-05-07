command! YAPIFetch call yapi#Fetch()

if !exists("g:yapi_populate_location_list")
  let g:yapi_populate_location_list = 0
endif
