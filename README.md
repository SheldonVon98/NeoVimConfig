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
pip3 install neovim autopep8 jedi==0.17.2

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Download required font and double click to install.
wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Agave/complete/agave%20regular%20Nerd%20Font%20Complete.ttf

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
