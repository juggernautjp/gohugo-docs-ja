---
aliases:
- /tutorials/deployment-with-rsync/
authors:
- Adrien Poupin
categories:
- hosting and deployment
date: "2017-02-01"
description: SSH を使用して Web ホストにアクセスできる場合は、単純な rsync ワンライナーを使用して、Hugo Web サイト全体をインクリメンタルにデプロイできます。
draft: false
keywords:
- rsync
- deployment
linktitle: Rsync を使ったデプロイメント
menu:
  docs:
    parent: hosting-and-deployment
    weight: 70
notesforauthors: null
publishdate: "2017-02-01"
sections_weight: 70
title: Rsync を使ったデプロイメント
toc: true
weight: 70
---

## 前提条件 {#assumptions}

* Web サーバーを実行している Web ホストがあること。 これは、共有ホスティング環境または VPS である可能性があります。
* SSH を使用して Web ホストにアクセスすること。
* Hugo で構築された機能的な静的 Web サイトがあること。

ネタバレになりますが、以下のコマンドで Web サイト全体をデプロイできます。

```bash
hugo && rsync -avz --delete public/ www-data@ftp.topologix.fr:~/www/
```

ご覧のように、このコマンドをシェルスクリプト ファイルに記述することで、`./deploy` を実行するのと同じように簡単にビルドとデプロイができるようになります。

## SSH キーをホストにコピーする {#copy-your-ssh-key-to-your-host}

サーバーへのログインをより安全に、対話を少なくするために、SSH キーをアップロードできます。 すでに SSH キーをサーバーにインストールしている場合は、次のセクションに進むことができます。

まず、ssh クライアントをインストールします。 Debian/Ubuntu/derivates の場合は、以下のコマンドを使用します。

{{< code file="install-openssh.sh" >}}
sudo apt-get install openssh-client
{{< /code >}}

次に、ssh キーを生成します。 最初に、ホーム ディレクトリに `.ssh` ディレクトリが存在しない場合は、以下のコマンドを実行して作成します。

```bash
~$ cd && mkdir .ssh & cd .ssh
```

次に、以下のコマンドを実行して、`rsa_id` という新しいキーペアを生成します。

```bash
~/.ssh/$ ssh-keygen -t rsa -q -C "For SSH" -f rsa_id
```

パスフレーズの入力を求められますが、これは追加の保護レイヤーです。使用したいパスフレーズを入力し、プロンプトが表示されたら再度入力するか、パスフレーズを設定しない場合は空白にしておきます。パスフレーズを使用しない場合、ログイン時にパスワードの入力を要求されないため、非対話的にファイルを転送することができますが、安全性は若干低くなります。

ログインを簡単にするために、以下のコマンドで `~/.ssh/config` ファイルに Web ホストの定義を追加します。 以下のコマンド実行において、 `HOST` は Web ホストの IP アドレスまたはホスト名に置き換え、`USER` はファイルを転送する際に Web ホストへのログインに使用するユーザー名で置き換えてください。

```bash
~/.ssh/$ cat >> config <<EOF
Host HOST
     Hostname HOST
     Port 22
     User USER
     IdentityFile ~/.ssh/rsa_id
EOF
```

次に、以下のように、`ssh-copy-id` コマンドで、ssh 公開鍵をリモートサーバにコピーします。

```bash
~/.ssh/$ ssh-copy-id -i rsa_id.pub USER@HOST.com
```

これで、簡単にリモートサーバーに接続できるようになりました。

```bash
~$ ssh user@host
Enter passphrase for key '/home/mylogin/.ssh/rsa_id':
```

SSH キーでログインできるようになったので、Hugo サイトのデプロイを自動化するスクリプトを作成しましょう。

## シェルスクリプト {#shell-script}

以下のように、Hugo ツリーのルートに `deploy` という名前の新しいスクリプトを作成します。

```bash
~/websites/topologix.fr$ editor deploy
```

以下のコンテンツを追加します。このとき、 `USER`、`HOST`、`DIR` の値を自分の好きな値に置き換えてください。

```bash
#!/bin/sh
USER=my-user
HOST=my-server.com
DIR=my/directory/to/topologix.fr/   # Web サイトのファイルが保存されるディレクトリ

hugo && rsync -avz --delete public/ ${USER}@${HOST}:~/${DIR} # これにより、ローカルのパブリック フォルダーにないサーバー上のすべてが削除されます

exit 0
```

`DIR` はリモートユーザーのホームからの相対パスであることに注意してください。フルパス (たとえば、 `/var/www/mysite/`) を指定しなければならない場合は、コマンドライン内で `~/${DIR}` を `${DIR}` に変更しなければなりません。ほとんどの場合、その必要はありません。

保存して閉じ、以下のコマンドで `deploy` ファイルを実行可能にします。

```bash
~/websites/topologix.fr$ chmod +x deploy
```

あとは、以下のコマンドを入力するだけで、Web サイトのデプロイと更新ができます。

```bash
~/websites/topologix.fr$ ./deploy
```

以下のように、あなたのサイトが構築され、デプロイされます。

```bash
Started building sites ...
Built site for language en:
0 draft content
0 future content
0 expired content
5 pages created
0 non-page files copied
0 paginator pages created
0 tags created
0 categories created
total in 56 ms
sending incremental file list
404.html
index.html
index.xml
sitemap.xml
posts/
posts/index.html

sent 9,550 bytes  received 1,708 bytes  7,505.33 bytes/sec
total size is 966,557  speedup is 85.86
```

このデプロイメント スクリプトには、他のプロセスタスクも組み入れることができます。
