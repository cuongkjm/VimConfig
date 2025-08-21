## compile vim
```
sudo apt update
sudo apt install -y build-essential ncurses-dev python3-dev gettext libacl1-dev libgpm-dev libncurses5-dev libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
./configure \
            --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=dynamic --with-python3-stable-abi=3.6 \
            --enable-terminal \
            --enable-cscope \
            --without-x \
            --disable-netbeans \
            --enable-fail-if-missing
make -j
sudo make install
```

## install vim plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## install vim plugins
```
vim ~/.vimrc
:PlugInstall
```

## install coc vim
- run in vim
```
:CocInstall coc-json coc-tsserver coc-clangd
```

- install nodejs
https://nodejs.org/en/download/

- create empty file `main.cpp` and open it in vim

- run in vim
```
:CocCommand clangd.install
```

Ref: https://github.com/neoclide/coc.nvim.git

## install vimspector
```
VimspectorInstall CodeLLDB
```

Ref: https://github.com/puremourning/vimspector.git

## install ripgrep (enable Rg command in vim)
```
sudo apt install -y ripgrep
```

## install The Silver Searcher (enable Ag command in vim)
```
sudo apt install -y silversearcher-ag
```

# Known issues
## vim does not recognize the terminal info
### Issue
```
E558: Terminal entry not found in terminfo
'foot' not known. Available builtin terminals are:
    builtin_ansi
    builtin_vt320
    builtin_vt52
    builtin_xterm
    builtin_iris-ansi
    builtin_pcansi
    builtin_win32
    builtin_amiga
    builtin_dumb
    builtin_debug
defaulting to 'ansi'
```
### Solution
- Add the following line to user's `~/.bashrc` or `~/.zshrc`
```
export TERM=xterm-256color
```
