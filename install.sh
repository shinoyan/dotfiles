#!/bin/bash
set -eu

cd $HOME

for file in .emacs.d
do
    [ ! -e $file ] && ln -s dotfiles/$file .
done
