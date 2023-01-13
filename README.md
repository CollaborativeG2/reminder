# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
3.1.3

# 環境構築
## docker を用いた環境構築
### git clone
```bash
git clone git@github.com:CollaborativeG2/reminder.git
```

### コンテナ立ち上げ
```bash
cd reminder
docker compose up -d
```

### migration
```bash
docker compose run web bundle exec rails db:migrate
```

### bundle install
[docker build](#docker-build実行) を実行する

### docker build実行
```bash
docker compose build
```

## ローカルを用いた環境構築

### ruby のインストール

#### windows
https://prog-8.com/docs/ruby-env-win  
[rubyダウンロードページ](https://rubyinstaller.org/downloads/)から `3.1.3` をダウンロード

インスーラーを使ってインストールする

#### mac(rbenv)
https://qiita.com/petertakahashi/items/1447c401c928d08a040b  
```bash
brew install rbenv
brew install ruby-build
```

パスを通す
```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile
```
※zshの場合は、`~/.zsh` or `~/.zsh_profile`

### postgres のインストール

#### windows
[postgres ダウンロードページ](https://www.postgresql.org/download/windows/)からインストーラーをダウンロードする

#### mac
```bash
brew install postgresql
```

### git clone
```bash
git clone https://github.com/CollaborativeG2/reminder.git
```

### bundle install
```bash
cd reminder
bundle install
```

### migration
```bash
bundle exec rails db:migrate
```

### サーバ立ち上げる
```bash
bundle exec rails server
```
