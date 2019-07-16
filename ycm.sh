#!/bin/bash
DIR=`pwd`

if [ -f "~/.ycm_extra_conf.py" ]; then 
   mv ~/.ycm_extra_conf.py ~/.ycm_extra_conf.py_back
fi
ln -sf $DIR/ycm_extra_conf.py ~/.ycm_extra_conf.py

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
