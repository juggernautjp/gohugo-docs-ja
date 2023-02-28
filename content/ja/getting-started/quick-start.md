---
aliases:
- /quickstart/
- /overview/quickstart/
categories:
- getting started
date: "2013-07-01"
description: Hugo サイトを数分で作成する方法を紹介します。
draft: false
keywords:
- quick start
- usage
linktitle: クイックスタート
menu:
  docs:
    parent: getting-started
    weight: 10
publishdate: "2013-07-01"
sections_weight: 10
title: クイックスタート
toc: true
weight: 10
---

このチュートリアルでは、以下のことを行います。

1. サイトを作成する
2. コンテンツを追加する
3. サイトを設定する
4. サイトを公開する

## 前提条件 {#prerequisites}

このチュートリアルを開始する前に、以下のことを行う必要があります。

1. [Hugo のインストール][Install Hugo] (拡張版)
2. [Git のインストール][Install Git]

また、コマンドラインからの操作に慣れている必要があります。

## サイトを作成する {#create-a-site}

### コマンド {#commands}

{{% note %}}
Windows ユーザーの場合は、これらのコマンドを [PowerShell] で実行する必要があります。 別のアプリケーションである Windows Powershell やコマンド プロンプトは使用できません。 可能であれば、Linux シェルを使用することもできます。

[PowerShell]: https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows
{{% /note %}}

これらのコマンドを実行して、[Ananke] テーマの Hugo サイトを作成します。 次のセクションでは、各コマンドについて説明します。

```bash
hugo new site quickstart
cd quickstart
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
echo "theme = 'ananke'" >> config.toml
hugo server
```

端末に表示された URL で自分のサイトを表示します。 `Ctrl + C` を押して、Hugo の開発サーバーを停止します。

### コマンドの説明 {#explanation-of-commands}

プロジェクトの [ディレクトリ構造][directory structure] を `quickstart` ディレクトリに作成します。

```bash
hugo new site quickstart
```

カレントディレクトリをプロジェクトのルートに変更します。

```bash
cd quickstart
```

カレントディレクトリに、空の Git リポジトリを初期化します。

```bash
git init
```

[Ananke] テーマを `themes` ディレクトリにクローンし、[Git サブモジュール][Git submodule] としてプロジェクトに追加します。

```bash
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```

以下のコマンドにより、サイト設定ファイルに現在のテーマを示す行を追加します。

```bash
echo "theme = 'ananke'" >> config.toml
```

Hugo の開発サーバーを起動し、サイトを表示します。

```bash
hugo server
```

`Ctrl + C` を押して、Hugo の開発サーバを停止します。

## コンテンツを追加する {#add-content}

サイトに新しいページを追加します。

```bash
hugo new posts/my-first-post.md
```

Hugo は `content/posts` ディレクトリにファイルを作成しました。 このファイルをエディターで開きます。

```yaml
---
title: "My First Post"
date: 2022-11-20T09:03:20-08:00
draft: true
---
```

[フロントマター][front matter] の `draft` 値が `true` であることに注目してください。デフォルトでは、Hugo はサイトをビルドする際に下書きのコンテンツを公開しません。詳細については、[下書き、公開予定、および期限切れのコンテンツ][draft, future, and expired content] を参照してください。

投稿の本文にいくつかの [markdown] を追加しますが、`draft` の値は変更しないでください。

[markdown]: https://commonmark.org/help/

```yaml
---
title: "My First Post"
date: 2022-11-20T09:03:20-08:00
draft: true
---
## Introduction

This is **bold** text, and this is *emphasized* text.

Visit the [Hugo](https://gohugo.io) website!
```

ファイルを保存し、Hugo の開発サーバを起動してサイトを表示します。以下のコマンドのいずれかを実行することで、下書きのコンテンツを取り込むことができます。

```bash
hugo server --buildDrafts
hugo server -D
```

端末に表示された URL でサイトを表示します。開発用サーバーを起動したまま、コンテンツの追加や変更を続けてください。

{{% note %}}
Hugo のレンダリング エンジンは、Markdown の CommonMark [仕様][specification] に準拠しています。 CommonMark 組織は、リファレンス実装を利用した便利な [ライブ テストツール][live testing tool] を提供しています。

[live testing tool]: https://spec.commonmark.org/dingus/
[specification]: https://spec.commonmark.org/
{{% /note %}}

## サイトを設定する {#configure-the-site}

プロジェクトのルートにある [サイト設定][site configuration] ファイル (`config.toml`) をエディターで開いてください。

```ini
baseURL = 'http://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = 'ananke'
```

以下のように変更します。

1. 本番用サイトの `baseURL` を設定します。この値は、上図のように、プロトコルで始まり、スラッシュで終わる必要があります。

2. `languageCode` に、言語と地域を設定します。

3. 本番用サイトの `title` を設定します。

Hugo の開発サーバーを起動して変更を確認します。下書きのコンテンツを含めることを忘れないでください。

```bash
hugo server -D
```

{{% note %}}
ほとんどのテーマの作者は、設定のガイドラインとオプションを提供しています。詳細については、テーマのリポジトリまたはドキュメントサイトを参照してください。

Ananke テーマの作者である [The New Dynamic] は、設定や使用方法についての [ドキュメント][documentation] を提供しています。また、[デモサイト][demonstration site] も提供されています。

[demonstration site]: https://gohugo-ananke-theme-demo.netlify.app/
[documentation]: https://github.com/theNewDynamic/gohugo-theme-ananke#readme
[The New Dynamic]: https://www.thenewdynamic.com/
{{% /note %}}

## サイトを公開する {#publish-the-site}

このステップでは、サイトを _公開_ しますが、_デプロイ_ はしません。

サイトを _公開する_ と、Hugo は静的なサイト全体をプロジェクトのルートにある `public` ディレクトリに作成します。これには、HTML ファイル、画像、CSS ファイル、JavaScript ファイルなどのアセットが含まれます。

サイトを公開するとき、通常、[下書き、公開予定、または期限切れのコンテンツ][draft, future, or expired content] を _含めないように_ したいものです。そうするコマンドは、以下のように簡単です。

```bash
hugo
```

サイトの _デプロイ_ 方法については、[ホスティングとデプロイ][hosting and deployment] のセクションを参照してください。

## 助けを求める {#ask-for-help}

Hugo の [フォーラム][forum] は、質問に答え、知識を共有し、例を提供するユーザーと開発者の活発なコミュニティです。20,000 を超えるトピックを素早く検索すれば、あなたの質問に答えられることが多いでしょう。最初の質問をする前に、必ず [ヘルプのリクエスト][requesting help] について読んでおいてください。

## その他のリソース {#other-resources}

書籍やビデオチュートリアルなど、Hugo の学習に役立つその他のリソースについては、[外部の学習リソース](/getting-started/external-learning-resources/) のページを参照してください。

[Ananke]: https://github.com/theNewDynamic/gohugo-theme-ananke
[directory structure]: /getting-started/directory-structure
[draft, future, and expired content]: /getting-started/usage/#draft-future-and-expired-content
[draft, future, or expired content]: /getting-started/usage/#draft-future-and-expired-content
[external learning resources]:/getting-started/external-learning-resources/
[forum]: https://discourse.gohugo.io/
[forum]: https://discourse.gohugo.io/
[front matter]: /content-management/front-matter
[Git submodule]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[hosting and deployment]: /hosting-and-deployment/
[Install Git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[Install Hugo]: /installation/
[requesting help]: https://discourse.gohugo.io/t/requesting-help/9132
[site configuration]: /getting-started/configuration/
