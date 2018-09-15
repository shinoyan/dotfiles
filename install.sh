#!/bin/bash
set -eu

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

# HOMEに移動
cd $HOME

# エイリアスを作成
for file in .emacs.d .bashrc .bash_aliases
do
    [ ! -e $file ] && ln -s $THIS_DIR/$file .
done
