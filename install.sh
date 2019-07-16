#!/bin/bash
DIR=`pwd`
git submodule update --init --recursive

# create backups if file exsits
if [ -d "~/.vim" ]; then 
  mv ~/.vim ~/.vim_back
fi 
if [ -f "~/.vimrc" ]; then 
  mv ~/.vimrc ~/.vimrc_back
fi
if [ -f "~/.tmux.conf" ]; then 
  mv ~/.tmux.conf ~/.tmux.conf_back
fi
if [ -f "~/.tmux.conf.local" ]; then 
  mv ~/.tmux.conf.local ~/.tmux.conf.local_back
fi
if [ -f "~/.profile" ]; then 
  mv ~/.profile ~/.profile_back
fi
if [ -f "~/.zprofile" ]; then 
  mv ~/.zprofile ~/.zprofile_back
fi
if [ -f "~/.zshrc" ]; then 
  mv ~/.zshrc ~/.zshrc_back
fi

# cause the vim bunduls maybe a little big
rm -rf ~/.vim_back


ln -sf $DIR/vimrc ~/.vimrc
ln -sf $DIR/vim ~/.vim
ln -sf $DIR/tmux.conf.local ~/.tmux.conf.local
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/profile ~/.profile
ln -sf $DIR/profile ~/.zprofile
ln -sf $DIR/zshrc ~/.zshrc


PLATFORM=`python -mplatform`
case $PLATFORM in
     *Ubuntu*)
           sudo apt-get update
           sudo apt install vim  tmux zsh;;
     *centos*)
           sudo yum update
           sudo yum install vim tmux zsh;;
     *Darwin*)
           brew install vim  tmux zsh;;
     *)
     echo "PLATFORM not support now.."
esac

# install vim plug-in youCompleteMe
cd $DIR
source ycm.sh
cd
chsh -s `which zsh`
exec zsh
