# dotfiles

自分用dotfiles

## install

### install.shを実行することで、$HOMEにdotfileが配置される

```
$ sh install.sh
```

### .bash_profileに以下を追記

```
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

### Homebrew
Homebrewをインストール後以下のコマンドで必要なアプリケーションを一括でインストールする。

```
$ brew bundle
```
