# **Reo VimRC**

![Screenshot](http://i.imgur.com/SkHZbHa.png)

## How to install

```sh
git clone --depth 1 https://github.com/reo7sp/ReoVimRC
cd ReoVimRC
./install
```

## How to update

```sh
./update
```

## How to add custom settings
For this purpose there is **~/.vimrc.user.after** file which you can edit as you want, and changes won't be lost after update. To add plugins use **~/.vimrc.user.install** file.

## Plugins
See [reovim/plugins.vim](reovim/plugins.vim)

## Mappings
_(there are not all of them, see [reovim/mappings](reovim/mappings) folder for more)_

| Key                | Action                                                      |
| ---                | ---                                                         |
| + _or_ c-tab       | Next buffer                                                 |
| _ _or_ c-shift-tab | Previous buffer                                             |
| c-s                | Save all buffers                                            |
| c-q                | Close buffer and return to the previous                     |
| ,q                 | Close buffer                                                |
| ,o                 | Close all buffers except current                            |
| c-p                | Search files                                                |
| ,p                 | Show file tree                                              |
| c-t                | Search functions, variables, etc in file                    |
| ,t                 | Show tree of functions, variables, etc in file              |
| c-l                | Search recent (last) files                                  |
| c-n                | Search buffers and windows                                  |
| :::                | Search commands                                             |
| \<space\>          | Quick search by char inside current buffer                  |
| ,\<space\>         | Search inside all files                                     |
| -                  | Clear highlighting of search results                        |
| yo                 | Enter inside mode with paste mode                           |
| ,y                 | See yank history                                            |
| c-j                | Complete snippet                                            |
| c-g                | Find next same selection and enable multicursor editing     |
| c-u                | Find previous same selection and enable multicursor editing |
| c-k                | Skip next same selection while doing multicursor editing    |
| ,nr                | Open current selection in separate buffer                   |
| cop                | Toggle system clipboard as default register                 |
| cow                | Toggle word wrap                                            |
| ga                 | Align text                                                  |
| gc                 | Toggle comment                                              |
| cr                 | Replace text                                                |

## Custom commands

| Command    | Action                                         |
| ---        | ---                                            |
| PlugSearch | Search vim plugins                             |
| PlugAdd    | Quick install vim plugin                       |
| cwd        | Change current directory to buffer's directory |
