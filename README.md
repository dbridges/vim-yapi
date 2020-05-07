# vim-yapi

`vim-yapi` integrates the [yapi](https://github.com/dbridges/yapi) CLI based API Client into vim.

Start with a `yapi.yml` file in the current buffer:

```yaml
---
# Project Settings
root: http://localhost:3000
session: my_project
headers:
  Content-Type: application/json
  Accept: application/json
print_headers: true

# Routes

users.index:
  path: /users
  params:
    page: 2
    per: 100

users.show:
  path: /users/1

users.create:
  path: /users
  method: POST
  body: |
    {
      "name": "Test User",
      "email": "testuser@example.com",
    }
```

Place your cursor anywhere inside a named request

```yaml
users.index:
  path: /users
  params: ▋ <-- Cursor 
    page: 2
    per: 100
```

and run `:YAPIFetch`.


## Installation

Use your preferred package management tool, for vim-plug:

```vim
Plug 'dbridges/vim-yapi'
```

`vim-yapi` requires [yapi](https://github.com/dbridges/yapi) to be installed.

You might consider mapping `:YAPIFetch` in your `.vimrc`:

```vim
autocmd BufRead,BufNewFile *yapi.yml nnoremap <buffer> <Leader>r :YAPIFetch<CR>
```
