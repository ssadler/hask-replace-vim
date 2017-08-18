# hask-replace-vim

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'vmchale/hask-replace-vim'
```

## Configuration

`hask-replace-vim` provides some keybindings, but you have to activate them
yourself. I have the following in my `.vimrc`:

```vim
au BufNewFile,BufRead *.hs nnoremap mcp <Plug>DuplicateHaskellMod
```
