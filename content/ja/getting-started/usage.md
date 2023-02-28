---
aliases:
- /overview/usage/
- /extras/livereload/
- /doc/usage/
- /usage/
categories:
- getting started
date: "2017-02-01"
description: Hugo の コマンドライン インターフェイス (CLI) は十分な機能を備えていますが、コマンドラインでの操作経験がほとんどない人でも簡単に使用できます。
draft: false
keywords:
- usage
- livereload
- command line
- flags
linktitle: 基本的な使用方法
menu:
  docs:
    parent: getting-started
    weight: 40
publishdate: "2017-02-01"
sections_weight: 40
title: 基本的な使用方法
toc: true
weight: 40
---

## インストールをテストする {#test-your-installation}

Hugo を [インストール][installing] し後で、正しくインストールされたかどうかを以下のコマンドで確認します。

```bash
hugo version
```

以下のようなものが表示されるはずです。

```text
hugo v0.105.0-0e3b42b4a9bdeb4d866210819fc6ddcf51582ffa+extended linux/amd64 BuildDate=2022-10-28T12:29:05Z VendorInfo=snap:0.105.0
```

## 利用可能なコマンドを表示する {#display-available-commands}

使用可能なコマンドとフラグのリストを表示するには、以下のコマンドを実行します。

```bash
hugo help
```

サブコマンドのヘルプを表示するには、`--help` フラグを使用します。 たとえば、以下のコマンドです。

```bash
hugo server --help
```

## サイトをビルドする {#build-your-site}

サイトをビルドするには、プロジェクト ディレクトリに `cd` して、以下のコマンドを実行します。

```bash
hugo
```

[`hugo`] コマンドはサイトをビルドし、ファイルを `public` ディレクトリに公開します。 サイトを別のディレクトリに公開するには、[`--destination`] フラグを使用するか、サイトの設定で [`publishDir`] を設定します。

{{% note %}}
Hugo はサイトをビルドする前に `public` ディレクトリをクリアしません。既存のファイルは上書きされますが、削除されることはありません。この動作は、ビルド後に `public` ディレクトリに追加したファイルが不用意に削除されるのを防ぐために意図的に行われています。

ニーズによっては、毎回のビルドの前に、`public` ディレクトリのコンテンツを手動でクリアすることもできます。
{{% /note %}}

## 下書き、公開予定、期限切れのコンテンツ {#draft-future-and-expired-content}

Hugo では、コンテンツの [フロントマター][front matter] に `draft` や `publishdate`、さらには `expirydate` を設定できます。デフォルトでは、Hugo は以下のコンテンツを公開しません。


- `draft` 値が `true` (下書き)
- `date` が将来の日付 (公開予定)
- `publishDate` が将来の日付 (公開予定)
- `expiryDate` が過去の日付 (期限切れ)

以下のコマンドライン フラグを使用して、`hugo` または `hugo server` を実行するときにデフォルトの動作をオーバーライドできます。

```bash
hugo --buildDrafts    # または -D
hugo --buildExpired   # または -E
hugo --buildFuture    # または -F
```

これらの値はサイトの設定で設定することもできますが、すべてのコンテンツ作成者がその設定を認識し、理解しない限り、望ましくない結果を招く可能性があります。

{{% note %}}
上で述べたように、Hugo はサイトを構築する前に `public` ディレクトリをクリアしません。上記の4つの条件の _現在_ の評価によっては、ビルド後に `public` ディレクトリに以前のビルドで作成した余計なファイルが残っている可能性があります。

一般的な方法は、下書き、期限切れ、および公開予定のコンテンツを削除するために、各ビルドの前に `public` ディレクトリの内容を手動でクリアすることです。
{{% /note %}}

## サイトの開発とテスト {#develop-and-test-your-site}

レイアウトの開発中またはコンテンツの作成中にサイトを表示するには、プロジェクト ディレクトリに `cd` して以下のコマンドを実行します。

```bash
hugo server
```

[`hugo server`] コマンドはサイトをメモリ上に構築し、最小限の HTTP サーバを使用してページを提供します。 `hugo server` を実行すると、ローカルサイトの URL が表示されます。

```text
Web Server is available at http://localhost:1313/ 
```

サーバーの実行中、サーバーはプロジェクト ディレクトリを監視して、アセット、設定、コンテンツ、データ、レイアウト、翻訳、および静的ファイルへの変更を監視します。 変更を検出すると、サーバーはサイトをリビルドし、[LiveReload] を使用してブラウザを更新します。

ほとんどの Hugo のビルドは非常に高速なので、ブラウザを直視していないと変化に気づかないかもしれません。

## LiveReload

サーバーの実行中に、Hugo は生成された HTML ページに JavaScript を挿入します。 LiveReload スクリプトは、Web ソケットを介してブラウザからサーバーへの接続を作成します。 ソフトウェアやブラウザ プラグインをインストールする必要はなく、設定も必要ありません。

### 自動リダイレクト {#automatic-redirection}

コンテンツを編集する際、最後に変更したページにブラウザーを自動的にリダイレクトする場合は、以下のコマンドを実行します。

```bash
hugo server --navigateToChanged
```

## サイトをデプロイする {#deploy-your-site}

{{% note %}}
上記のように、Hugo はサイトをビルドする前に public ディレクトリをクリアしません。 各ビルドの前に public ディレクトリの内容を手動でクリアして、下書き、期限切れ、および公開予定のコンテンツを削除します。
{{% /note %}}

サイトをデプロイする準備ができたら、以下のコマンドを実行します。

```bash
hugo
```

これにより、サイトがビルドされ、ファイルが public ディレクトリに公開されます。 ディレクトリ構造は、以下のようになります。

```text
public/
├── categories/
│   ├── index.html
│   └── index.xml  <-- RSS feed for this section
├── post/
│   ├── my-first-post/
│   │   └── index.html
│   ├── index.html
│   └── index.xml  <-- RSS feed for this section
├── tags/
│   ├── index.html
│   └── index.xml  <-- RSS feed for this section
├── index.html
├── index.xml      <-- RSS feed for the site
└── sitemap.xml
```

シンプルなホスティング環境では、通常ファイルを `ftp` や `rsync` 、あるいは `scp` して仮想ホストのルートに置くのですが、 必要なのは `public` ディレクトリの内容だけです。

多くのユーザーは、GitHub や GitLab のリポジトリにプッシュ [^1] することでビルドとデプロイを行う CI/CD ワークフローを使用してサイトをデプロイしています。人気のプロバイダーは、[AWS Amplify]、[CloudCannon]、[Cloudflare Pages]、[GitHub Pages]、[GitLab Pages]、[Netlify] などがあります。

詳しくは、[「ホスティングとデプロイメント」][hosting and deployment] のセクションを参照してください。

[^1]: Git リポジトリにはプロジェクト ディレクトリ全体が含まれますが、サイトはプッシュ _後_ にビルドされるため、通常は public ディレクトリは除外されます。

[`--destination`]: /commands/hugo/#options
[`hugo server`]: /commands/hugo_server/
[`hugo`]: /commands/hugo/
[`publishDir`]: /getting-started/configuration/#publishdir
[AWS Amplify]: https://aws.amazon.com/amplify/
[CloudCannon]: https://cloudcannon.com/
[Cloudflare Pages]: https://pages.cloudflare.com/
[commands]: /commands/
[front matter]: /content-management/front-matter/
[GitHub Pages]: https://pages.github.com/
[GitLab Pages]: https://docs.gitlab.com/ee/user/project/pages/
[hosting and deployment]: /hosting-and-deployment/
[hosting]: /hosting-and-deployment/
[installing]: /installation/
[LiveReload]: https://github.com/livereload/livereload-js
[Netlify]: https://www.netlify.com/
