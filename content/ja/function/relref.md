---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: ページへの相対パーマリンクを返します。
draft: false
hugoversion: null
keywords:
- cross references
- anchors
lastmod: "2020-09-05"
linktitle: relref
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- ref
signature:
- relref . PAGE
title: relref
workson: []
---

この関数は、以下の 2 つのパラメータを受け取ります。

- 相対パスを解決するページのコンテキストで、通常は現在のページ (`.`)
- ファイル拡張子の有無、アンカーの有無にかかわらず、ページへのパス。 先頭に `/` がないパスは、まず指定されたコンテキストからの相対パスを解決し、次にサイトの残りの部分からの相対パスを解決します。

```go-html-template
{{ relref . "about" }}
{{ relref . "about#anchor" }}
{{ relref . "about.md" }}
{{ relref . "about.md#anchor" }}
{{ relref . "#anchor" }}
{{ relref . "/blog/my-post" }}
{{ relref . "/blog/my-post.md" }}
```

返されるパーマリンクは、サイト設定で指定された baseURL の プロトコル ＋ ホスト部分 からの相対パスです。 たとえば、以下のようになります。

コード | baseURL | パーマリンク (Permalink)
:--|:--|:--
`{{ relref . "/about" }}`|`http://example.org/`|`/about/`
`{{ relref . "/about" }}`|`http://example.org/x/`|`/x/about/`

他言語版ページへの相対パーマリンクを返す場合は、以下のようになります。

```go-html-template
{{ relref . (dict "path" "about.md" "lang" "fr") }}
```

ページの別の出力形式への相対パーマリンクを返す場合は、以下のようになります。

```go-html-template
{{ relref . (dict "path" "about.md" "outputFormat" "rss") }}
```

ページを一意に解決できない場合、Hugo はエラーまたは警告を発します。 エラーの動作は設定可能です。 [「Ref と RelRef の設定」](/content-management/cross-references/#ref-and-relref-configuration) を参照してください。

この関数は、Hugo の組み込み [`relref`](/content-management/shortcodes/#ref-and-relref) ショートコードで使用されます。 このショートコードをコンテンツ管理に活用する方法の詳細については、[「リンクとクロスリファレンス」](/content-management/cross-references/) を参照してください。
