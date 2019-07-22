# Vampire's dotfiles

### Descriptions
Dotfiles on Macos and Linux(Ubuntu, centos test, other distributions may need a little revise).
Mainly use zsh for default shell,  tmux & vim to work.

### Install
```
git clone https://github.com/vampire321/dotfiles.git
cd dotfiles && ./install.sh
```
if you want YouCompleteMe:
```
./ycm.sh
```

Note:
+ During some reasons, you may have to use network scientifically in the China Mainland to get some tools needed by YouCompleteMe.(But if not, you will failed to use powerful YouCompleteMe,but can still use other parts) 
+ On centos, you may need to comlile&install a 8.0+vim to use ycm.

### How to use
1. add or rivise snippets in vim/UltiSnips as you want, and <Tab> to fly.

2. add templates in vim/templates will help you to  setup a file quickly.

3. all the config files is in configFiles, edit as you like.(since it do not source ~/.bash_profile, you can transfer your original configs to ~/.bashrc) 

### Thanks
hzshang's dotfiles
