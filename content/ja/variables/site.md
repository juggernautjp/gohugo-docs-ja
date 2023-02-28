---
aliases:
- /variables/site-variables/
categories:
- variables and params
date: "2017-02-01"
description: すべてではありませんが、多くのサイト全体の変数がサイト設定で定義されます。
  ただし、Hugo には、テンプレート内のグローバル値に簡単にアクセスできるように、多数の組み込み変数が用意されています。
draft: false
keywords:
- global
- site
lastmod: "2017-02-01"
linktitle: サイト変数
menu:
  docs:
    parent: variables
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
title: サイト変数
toc: true
weight: 10
---

以下はサイトレベル (別名 「グローバル」) 変数のリストです。 これらの変数の多くはサイトの [設定ファイル][config] で定義されますが、他の変数は Hugo のコアに組み込まれており、テンプレートで便利に使用できます。

## 部分テンプレートからサイトオブジェクトを取得する {#get-the-site-object-from-a-partial}

以下のすべてのメソッド、たとえば `.Site.RegularPages` は、グローバルな [`site`](/functions/site/) 関数からもアクセスできます。たとえば `site.RegularPages` は、 `Page` オブジェクトを簡単に利用できない部分テンプレートで便利です。 {{< new-in "0.53" >}}.

## サイト変数リスト {#site-variables-list}

.Site.AllPages
: 翻訳に関係ない、すべてのページの配列です。

.Site.Author
: サイト設定で定義された、作成者のマップです。

.Site.BaseURL
: サイト設定で定義された、サイトのベース URL です。

.Site.BuildDrafts
: サイト設定で定義された、ドラフトをビルドするかどうかを示すブール値 (デフォルトは `false`) です。

.Site.Copyright
: サイト設定で定義された、 Web サイトの著作権を表す文字列です。

.Site.Data
: カスタムデータについては、[「データテンプレート」](/templates/data-templates/) を参照してください。

.Site.DisqusShortname
: サイト設定で定義された、 Disqus ショートコードのショートネームを表す文字列です。

.Site.GoogleAnalytics
: サイト設定で定義定義された、 Google アナリティクスのトラッキング コードを表す文字列です。

.Site.Home
: ホームページの [ページオブジェクト](https://gohugo.io/variables/page/) への参照です。

.Site.IsMultiLingual
: このサイトに複数の言語があるかどうか。 詳細については、[「多言語対応」](/content-management/multilingual/) を参照してください。

.Site.IsServer
: Hugo の組み込みサーバーでサイトを提供するかどうかを示すブール値です。 詳細については、[`hugo server`](/commands/hugo_server/) を参照してください。

.Site.Language.Lang
: 現在のロケールの言語コード (たとえば、 `en`) を指定します。

.Site.Language.LanguageName
: 完全な言語名 (たとえば、 `English`) を指定します。

.Site.Language.Weight
: `.Site.Languages` リストでの順序を定義する重みです。

.Site.Language
: Web サイトのレンダリングに現在使用されている言語を示します。 このオブジェクトの属性は、サイト設定の言語定義で設定されます。

.Site.LanguageCode
: サイト設定で定義された言語タグを表す文字列です。

.Site.LanguagePrefix
: これは、正しい言語を指すように URL にプレフィックスを付けるために使用できます。 定義された言語が 1 つだけの場合でも機能します。 関数 [absLangURL](/functions/abslangurl/) および [relLangURL](/functions/rellangurl) も参照してください。

.Site.Languages
: (定義された重みで並べられた) 言語の順序付きリストです。

.Site.LastChange
: サイトが最後に変更された日時を表す文字列です。 この文字列は、コンテンツページの [フロントマターの `date` 変数](/content-management/front-matter) に基づいています。

.Site.Menus
: サイト内のすべてのメニューです。

.Site.Pages
: 日付順に並べられたすべてのコンテンツの配列で、最新のものを先頭にします。 この配列には、現在の言語のページのみが含まれます。 [`.Site.Pages`]({{< relref "site.md#site-pages" >}}) を参照してください。

.Site.RegularPages
: *通常* ページのコレクションへのショートカットです。 `.Site.RegularPages` は、 `where .Site.Pages "Kind" "page"` と同等です。 [`.Site.Pages`]({{< relref "site.md#site-pages" >}}) を参照してください。

.Site.Sections
: サイトのトップレベルディレクトリです。

.Site.Taxonomies
: サイト全体の [タクソノミー](/taxonomies/usage/) です。また、[「タクソノミー テンプレートの外で `.Site.Taxonomies` を使用する」](/variables/taxonomy/#use-sitetaxonomies-outside-of-taxonomy-templates) のセクションも参照して下さい。

.Site.Title
: サイトのタイトルを表す文字列です。

## `.Site.Params` 変数 {#the-siteparams-variable}

`.Site.Params` は、サイト設定の `params` セクションからの値を保持するコンテナです。

### 例: `.Site.Params` {#example-siteparams}

以下の `config.[yaml|toml|json]` は、`description` のサイト全体のパラメータを定義します。

{{< code-toggle file="config" >}}
baseURL = "https://yoursite.example.com/"

[params]
  description = "テスラの素晴らしい Hugo サイト"
  author = "Nikola Tesla"
{{</ code-toggle >}}

[部分テンプレート](/templates/partials/) の中で `.Site.Params` を使用すると、デフォルトのサイトの説明文を呼び出すことができます。

{{< code file="layouts/partials/head.html" >}}
<meta name="description" content="{{if .IsHome}}{{ $.Site.Params.description }}{{else}}{{.Description}}{{end}}" />
{{< /code >}}

## `.Site.Pages` 変数 {#site-pages}

### `.Site.Pages` と `.Pages` の比較 {#sitepages-compared-to-pages}

{{< getcontent path="readfiles/pages-vs-site-pages.md" >}}

[config]: /getting-started/configuration/
