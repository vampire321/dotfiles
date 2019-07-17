#!/bin/bash
DIR=`pwd`
git submodule update --init --recursive

# create backups if file exsits
if [ -d "~/.vim" ]; then 
  mv ~/.vim ~/.vim_back
fi 
if [ -L "~/.vim" ]; then
  rm ~/.vim
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

ln -sf $DIR/vim ~/.vim
ln -sf $DIR/configFiles/vimrc ~/.vimrc
ln -sf $DIR/configFiles/tmux.conf.local ~/.tmux.conf.local
ln -sf $DIR/configFiles/tmux.conf ~/.tmux.conf
ln -sf $DIR/configFiles/profile ~/.profile
ln -sf $DIR/configFiles/profile ~/.zprofile
ln -sf $DIR/configFiles/zshrc ~/.zshrc

PLATFORM=`python -mplatform`
case $PLATFORM in
     *Ubuntu*)
           sudo apt-get update
           sudo apt install vim  tmux zsh;;
     *centos*)
           sudo yum update
           sudo yum install vim tmux zsh;;
     *Darwin*)
           brew install coreutils
           brew install vim  tmux zsh;;
     *)
     echo "PLATFORM not support now.."
esac

# install YouCompleteMe
if [ -f "~/.ycm_extra_conf.py" ]; then
   mv ~/.ycm_extra_conf.py ~/.ycm_extra_conf.py_back
fi
ln -sf $DIR/configFiles/ycm_extra_conf.py ~/.ycm_extra_conf.py


cd vim/bundle/YouCompleteMe
git submodule update --init --recursive
PLATFORM=`python -mplatform`
case $PLATFORM in
    *Ubuntu*)
        sudo apt-get install build-essential cmake -y
        sudo apt-get install python-dev python3-dev -y
        ./install.py --clang-completer;;
    *centos*)
        sudo yum install build-essential cmake -y
        sudo yum install python-dev python3-dev -y
        ./install.py --clang-completer;;
    *Darwin*)
        ./install.py --clang-completer;;
    *)
    echo "PLATFORM not support now.."
esac
echo "ycm done."
cd
chsh -s `which zsh`
exec zsh
