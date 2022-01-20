# NeoVimConfig
 Customized Configuration for neovim

# Installation

## install NeoVim 
* version  v0.5+
### Ubuntu
```
sudo add-apt-repository ppa:neovim-ppa/stable 
sudo apt-get install neovim
```
### Mac
```
brew install neovim
```
## install dependencies
```
# Python
pip3 install neovim autopep8

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```
# Configure nvim
Download configuration file from this repository
```
mkdir -p ~/.config/nvim

wget https://raw.githubusercontent.com/SheldonVon98/NeoVimConfig/main/init.vim -O ~/.config/nvim/init.vim
```
Open nvim and install plugins
```
nvim

:PlugInstall
```
Restart nvim and you are free to go.