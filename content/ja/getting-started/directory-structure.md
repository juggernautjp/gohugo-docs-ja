---
aliases:
- /overview/source-directory/
categories:
- getting started
- fundamentals
date: "2017-01-02"
description: Hugo の CLI は、プロジェクトのディレクトリ構造を足場にして、その 1 つのディレクトリを入力として、完全なウェブサイトを作成できます。
draft: false
keywords:
- source
- organization
- directories
linktitle: ディレクトリ構造
menu:
  docs:
    parent: getting-started
    weight: 50
publishdate: "2017-02-01"
sections_weight: 50
title: ディレクトリ構造
toc: true
weight: 50
---

## 新しいサイトの足場かけ (スキャフォールディング) {#new-site-scaffolding}

{{< youtube sB0HLHjgQ7E >}}

コマンドラインから `hugo new site` ジェネレーターを実行すると、以下の要素からなるディレクトリ構造が作成されます。

```txt
example/
├── archetypes/
│   └── default.md
├── assets/
├── content/
├── data/
├── layouts/
├── public/
├── static/
├── themes/
└── config.toml
```

## ディレクトリ構造の説明 {#directory-structure-explained}

以下は、各ディレクトリの概要と、Hugo ドキュメント内の各セクションへのリンクです。

[`archetypes`](/content-management/archetypes/)
: Hugo では `hugo new` コマンドを使用して、新しいコンテンツファイルを作成することができます。
デフォルトでは、Hugo は少なくとも `date`、`title` (ファイル名から推測)、`draft = true` を含む新しいコンテンツファイルを作成します。これは時間を節約し、複数のコンテンツタイプを使用するサイトの一貫性が促進されます。また、独自の [アーキタイプ][archetypes] を作成し、事前に設定されたカスタム フロントマター フィールドを使用することもできます。

[`assets`][]
: [Hugo パイプ](/hugo-pipes/) で処理する必要のあるすべてのファイルを保存します。 `.Permalink` または `.RelPermalink` が使用されているファイルだけが、 `public` ディレクトリに公開されます。**注意**: assets ディレクトリはデフォルトでは作成されません。

[`config`](/getting-started/configuration/)
: Hugo には多数の [設定ディレクティブ][configuration directives] が同梱されています。
[config ディレクトリ](/getting-started/configuration/#configuration-directory) は、これらのディレクティブが JSON、YAML、または TOML ファイルとして格納される場所です。すべてのルート設定オブジェクトはそれ自身のファイルとして存在することができ、環境ごとに構造化されます。
最小限の設定しか行わず、環境を意識する必要のないプロジェクトでは、ルートで 1 つの `config.toml` ファイルを使用できます。

多くのサイトではほとんど設定が必要ないかもしれませんが、Hugo には数多くの [設定ディレクティブ][configuration directives] が同梱されており、Hugo にどのようにウェブサイトを構築させたいかを詳細に指示することができます。**注意**: デフォルトでは config ディレクトリは作成されません。

[`content`][]
: Web サイトのすべてのコンテンツは、このディレクトリの中に置かれます。Hugo のトップレベルの各フォルダーは、[コンテンツ セクション][content section] と呼ばれます。たとえば、あなたのサイトに 3 つのメインセクション --- `blog`、`articles`、`tutorials `-- がある場合、`content/blog`、`content/articles`、`content/tutorials` という 3 つのディレクトリを持つことになります。Hugo はセクションを使用して、デフォルトの [コンテンツタイプ][content types] を割り当てます。

[`data`](/templates/data-templates/)
: このディレクトリは、Web サイトを生成する際に Hugo が使用する設定ファイルを格納するために使用されます。
これらのファイルは、YAML、JSON、または TOML 形式で記述できます。このフォルダーに追加するファイルに加えて、動的なコンテンツから取得する [データテンプレート][data templates] を作成することもできます。

[`layouts`][]
: 静的な Web サイトへコンテンツをレンダリングする方法を指定する、`.html` ファイル形式のテンプレートが保存されます。テンプレートには、[リストページ][lists]、[ホームページ][homepage]、[タクソノミー テンプレート][taxonomy templates]、[パーシャル (部分テンプレート)][partials]、[シングルページ テンプレート][singles]、その他多数が含まれます。

[`static`][]
: すべての静的コンテンツ (画像、CSS、JavaScript など) を格納します。Hugo がサイトをビルドするとき、静的ディレクトリ内のすべてのアセットがそのままコピーされます。 `static` フォルダーーを使用する良い例としては、[Google Search Console でサイトの所有権を確認する][searchconsole] 場合で、Hugo に HTML ファイルの内容を変更せずに完全にコピーさせたい場合です。

{{% note %}}
**Hugo 0.31** からは、複数の静的ディレクトリを持つことができるようになりました。
{{% /note %}}

[`resources`][]
: いくつかのファイルをキャッシュし、生成を高速化します。テンプレート作成者がビルドされた Sass ファイルを配布するために使用することもできますので、プリプロセッサーをインストールする必要はありません。**注意**: resources ディレクトリはデフォルトでは作成されません。

[archetypes]: /content-management/archetypes/
[`assets`]: /hugo-pipes/introduction#asset-directory/
[configuration directives]: /getting-started/configuration/#all-configuration-settings
[`content`]: /content-management/organization/
[content section]: /content-management/sections/
[content types]: /content-management/types/
[data templates]: /templates/data-templates/
[homepage]: /templates/homepage/
[`layouts`]: /templates/
[`static`]: /content-management/static-files/
[`resources`]: /getting-started/configuration/#configure-file-caches
[lists]: /templates/list/
[pagevars]: /variables/page/
[partials]: /templates/partials/
[searchconsole]: https://support.google.com/webmasters/answer/9008080#zippy=%2Chtml-file-upload
[singles]: /templates/single-page-templates/
[starters]: /tools/starter-kits/
[taxonomies]: /content-management/taxonomies/
[taxonomy templates]: /templates/taxonomy-templates/
[types]: /content-management/types/
