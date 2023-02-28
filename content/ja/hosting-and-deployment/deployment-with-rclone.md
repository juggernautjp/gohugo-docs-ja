---
aliases:
- /tutorials/deployment-with-rclone/
authors:
- Daniel F. Dickinson
categories:
- hosting and deployment
date: "2021-08-09"
description: SFTP/FTP/SSH/HTTP (DAV) を使用して Web ホストにアクセスできる場合は、rclone を使用して Hugo Web サイト全体をインクリメンタルにデプロイできます。
draft: false
keywords:
- rclone
- sftp
- deployment
lastmod: "2021-08-09"
linktitle: Rclone を使ったデプロイメント
menu:
  docs:
    parent: hosting-and-deployment
    weight: 80
notesforauthors: null
publishdate: "2021-08-09"
sections_weight: 80
title: Rclone を使ったデプロイメント
toc: true
weight: 80
---

## 前提条件 {#assumptions}

* Web サーバーを実行している Web ホストがあること。 これは、共有ホスティング環境または VPS である可能性があります。
* SFTP などの [rclone がサポートするプロトコル](https://rclone.org/#providers) のいずれかを使用して Web ホストにアクセスできること。
* Hugo で構築された機能的な静的 Web サイトがあること。
* [Rclone](https://rclone.org) 互換の OS からのデプロイであること。
* [Rclone がインストールされている](https://rclone.org/install/) こと。

**注意**: rclone に慣れたら、以下のコマンドの `--interactive` を削除してもかまいません。また、以下の `hugo` コマンドでは、 `--gc` と `--minify` は省略可能です。

## 入門 {#getting-started}

ネタバレになりますが、互換性のある OS であれば、設定なしで Web サイト全体をデプロイできます。 たとえば、SFTP を使う場合は、以下のコマンドを実行します。

```bash
hugo --gc --minify
rclone sync --interactive --sftp-host sftp.example.com --sftp-user www-data --sftp-ask-password public/ :sftp:www/
```

## さらに使いやすくするために Rclone を設定する {#configure-rclone-for-even-easier-usage}

最も簡単な方法は、単に `rclone config` を実行することです。

[Rclone ドキュメント](https://rclone.org/docs/) には、[SFTP を使用するように Rclone を設定する例](https://rclone.org/sftp/) が掲載されています。

次のコマンドでは、 `hugo-www` という名前のリモートユーザーを設定したものとします。

上記の「ネタバレ」コマンドは、以下のようになります。

```txt
hugo --gc --minify
rclone sync --interactive public/ hugo-www:www/
```

上記のコマンドを発行した後 (そしてプロンプトに応答した後)、Web サイトを確認すると、サイトがデプロイされていることが確認できます。
