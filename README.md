# Linux dotfiles user guide
Dotfiles for:
- tmux
- vim
- ZSH
- kitty + colorscheme

## General symlinking advice
All of the hidden files need to be in your home directory (as far as I am aware) so in order to keep these files version tracked, you can symlink from the git repo into your home directory. It is also nice to keep the coronaScraper script in a folder labelled .tmux, allowing for more potential bash scripts to be run in the tmux status bar, again using symlinking is advised.

  `ln -s gitrepo/file ~/file`

## tmux
Uses the file coronaScraper.py to output the 7 day average stats for cases and deaths in UK or a local area (currently set to Birmingham)

## vim
Plugins require vim-plugged. You can download this using the commands:
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Following this, you can install the plugins using `:PlugInstall` while inside a vim session

## ZSH
### To change shell to zsh:
1) install with package manager of choice e.g `sudo dnf install zsh`
2) Verify installation by running `zsh --version`
3) Make it your default shell: `chsh -s $(which zsh)
4) Log back out and back in to use your new default shell

### Install oh-my-zsh:

  `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Now you can move the .zshrc file inside this repo into your home directory.

### Extensions:
1) zsh-autosuggestions `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
2) zsh-syntax-highlighting `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

### side note:
I have my aliases set in a separate (private) file but doing something like this is a nice way to keep your zshrc file clean
