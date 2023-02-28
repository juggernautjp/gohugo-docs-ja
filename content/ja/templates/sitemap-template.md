---
aliases:
- /layout/sitemap/
- /templates/sitemap/
categories:
- templates
date: "2017-02-01"
description: Hugo には組み込みのサイトマップ テンプレートが用意されています。
draft: false
keywords:
- sitemap
- xml
- templates
menu:
  docs:
    parent: templates
    weight: 160
sections_weight: 160
title: サイトマップ テンプレート
toc: true
weight: 160
---

## 概要 {#overview}

Hugo の組み込みサイトマップ テンプレートは、[サイトマップ プロトコル][sitemap protocol] の v0.9 に準拠しています。

単一言語プロジェクトでは、Hugo は組み込みの [sitemap.xml] テンプレートを使用して、[`publishDir`] のルートに sitemap.xml ファイルを生成します。

多言語プロジェクトで、Hugo は以下を生成します。

- 組み込みの [sitemap.xml] テンプレートを使用した、各サイト (言語) のルートにある sitemap.xml ファイル
- 組み込みの [sitemapindex.xml] テンプレートを使用した、 [`publishDir`] のルートにある sitemap.xml ファイル

## 設定 {#configuration}

[変更頻度][change frequency] と [優先度][priority] のデフォルト値、および生成されるファイル名は、サイト設定で設定してください。

{{< code-toggle file="config" >}}
[sitemap]
  changefreq = 'monthly'
  filename = 'sitemap.xml'
  priority = 0.5
{{</ code-toggle >}}

changefreq
: ページが変更される頻度を指定します。有効な値は `always`、`hourly`、`daily`、`weekly`、`monthly`、`yearly` そして `never` です。 デフォルトは `""`  です (レンダリングされたサイトマップでは変更頻度が省略されます)。

filename
: 生成されるファイルの名前です。デフォルトは、 `sitemap.xml` です。

priority
: サイト上の他のページと比較したページの相対的な優先度です。有効な値は 0.0 から 1.0 までです。 デフォルトは `-1` です (サイトマップのレンダリングでは優先順位が省略されます)。

## デフォルト値をオーバーライドする {#override-default-values}

指定されたページのデフォルト値をフロントマターでオーバーライドします。

{{< code-toggle file="news.md" fm=true >}}
title = 'News'
[sitemap]
  changefreq = 'weekly'
  priority = 0.8
{{</ code-toggle >}}

## 組み込みテンプレートをオーバーライドする {#override-builtin-templates}

組み込みの sitemap.xml テンプレートをオーバーライドするには、以下のいずれかの場所に新しいファイルを作成します。

- layouts/sitemap.xml
- layouts/_default/sitemap.xml

ページコレクションにアクセスする場合、_変更頻度_ と _優先度_ には、それぞれ `.Sitemap.ChangeFreq` と `.Sitemap.Priority` を指定します。

組み込みの sitemapindex.xml テンプレートをオーバーライドするには、以下のいずれかの場所に新しいファイルを作成します。

- layouts/sitemapindex.xml
- layouts/_default/sitemapindex.xml

## サイトマップの生成を無効にする {#disable-sitemap-generation}

以下のサイト設定で、サイトマップの生成を無効にすることができます。

{{< code-toggle file="config" >}}
disableKinds = ['sitemap']
{{</ code-toggle >}}

[`publishDir`]: {{< relref "getting-started/configuration#publishdir" >}}
[change frequency]: <https://www.sitemaps.org/protocol.html#changefreqdef>
[priority]: <https://www.sitemaps.org/protocol.html#priority>
[sitemap protocol]: <https://www.sitemaps.org/protocol.html>
[sitemap.xml]: <https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/sitemap.xml>
[sitemapindex.xml]: <https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/sitemapindex.xml>
