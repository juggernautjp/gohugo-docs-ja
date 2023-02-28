---
categories:
- templates
date: "2017-02-01"
description: Hugo には、ほとんど設定が不要な独自の RSS 2.0 テンプレートが同梱されています。また、独自の RSS テンプレートを作成することもできます。
draft: false
keywords:
- rss
- xml
- templates
lastmod: "2017-02-01"
linktitle: RSS テンプレート
menu:
  docs:
    parent: templates
    weight: 150
publishdate: "2017-02-01"
sections_weight: 150
title: RSS テンプレート
toc: true
weight: 150
---

## RSS テンプレートの検索順序 {#rss-template-lookup-order}

完全なリファレンスについては、[テンプレートの検索順序](/templates/lookup-order/) を参照してください。

{{% note "Hugo Ships with an RSS Template" %}}
Hugo には、独自の [RSS 2.0 テンプレート](#the-embedded-rssxml) が付属しています。ほとんどの場合、この埋め込みテンプレートで十分です。
{{% /note %}}

RSS ページは `Page` というタイプで、テンプレートで使用できるすべての [ページ変数](/variables/page/) を持っています。

### セクション RSS {#section-rss}

[セクションの][section] RSS は `/<SECTION>/index.xml` にレンダリングされます (たとえば、 [https://spf13.com/project/index.xml](https://spf13.com/project/index.xml))。

Hugo は、必要な RSS タイプを定義する機能を提供し、セクションとタクソノミーごとに異なる RSS ファイルを持つことができます。

## RSS テンプレートのための検索順序 {#lookup-order-for-rss-templates}

以下の表は、異なる種類のページに対する RSS テンプレートの検索順序を示しています。 最初のリストは、テーマ (`demoTheme`) で実行した場合の検索順序を表しています。

{{< datatable-filtered-ja "output" "layouts" "OutputFormat == RSS" "Example" "OutputFormat" "Suffix" "Template Lookup Order" >}}

## RSS を設定する {#configure-rss}

デフォルトでは、Hugo は無制限の数の RSS エントリを作成します。 プロジェクトの [`config` ファイル][config] の `rssLimit:` フィールドに数値を割り当てることで、組み込みの RSS テンプレートに含まれる記事の数を制限できます。

また、以下の値が指定されている場合は、RSS 出力に含まれます。

{{< code-toggle file="config" >}}
languageCode = "en-us"
copyright = "This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License."

[author]
    name = "My Name Here"
{{< /code-toggle >}}

## 埋め込み型 rss.xml {#the-embedded-rssxml}

以下は、Hugo に同梱されているデフォルトの RSS テンプレートです。

<https://github.com/gohugoio/hugo/blob/master/tpl/tplimpl/embedded/templates/_default/rss.xml>

## `<head>` で RSS フィードを参照する {#reference-your-rss-feed-in-head}

`header.html` テンプレートでは、以下のように Hugo の [出力形式][Output Formats] を使用して `<head></head>` タグで RSS フィードを指定できます。

```go-html-template
{{ range .AlternativeOutputFormats -}}
    {{ printf `<link rel="%s" type="%s" href="%s" title="%s" />` .Rel .MediaType.Type .Permalink $.Site.Title | safeHTML }}
{{ end -}}
```

RSS のリンクだけが必要な場合は、フォーマットをクエリできます。

```go-html-template
{{ with .OutputFormats.Get "rss" -}}
    {{ printf `<link rel="%s" type="%s" href="%s" title="%s" />` .Rel .MediaType.Type .Permalink $.Site.Title | safeHTML }}
{{ end -}}
```

上記の 2 つのスニペットのどちらかを使用すると、サイトのホームページに以下のような RSS 出力用の `link` タグが生成されます。

```html
<link rel="alternate" type="application/rss+xml" href="https://example.com/index.xml" title="Site Title">
```

_上記の例では、`BaseURL` を `https://example.com/`、`$.Site.Title`を `"Site Title"` と仮定しています。_

[config]: /getting-started/configuration/
[embedded]: #the-embedded-rss-xml
[RSS 2.0]: https://cyber.harvard.edu/rss/rss.html "RSS 2.0 仕様書"
[section]: /content-management/sections/
[Output Formats]: /templates/output-formats/#link-to-output-formats
