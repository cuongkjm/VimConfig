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

## install ripgrep (enable Rg command in vim)
```
sudo apt install -y ripgrep
```

## install The Silver Searcher (enable Ag command in vim)
```
sudo apt install -y silversearcher-ag
```
