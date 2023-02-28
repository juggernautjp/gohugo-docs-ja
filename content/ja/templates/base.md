---
aliases:
- /templates/blocks/
- /templates/base-templates-and-blocks/
categories:
- templates
- fundamentals
date: "2017-02-01"
description: ベースおよびブロック構造を使用すると、マスターテンプレートの外側のシェル (つまり、ページのクロム) を定義できます。
draft: false
keywords:
- blocks
- base
linktitle: null
menu:
  docs:
    parent: templates
    weight: 20
publishdate: "2017-02-01"
sections_weight: 20
title: ベーステンプレートとブロック
toc: true
weight: 20
---

`block` キーワードを使用すると、ページの 1 つまたは複数のマスターテンプレートの外側のシェルを定義し、必要に応じて部分を埋めたり上書きしたりできます。

{{< youtube QVOMCYitLEc >}}

## ベーステンプレートの検索順序 {#base-template-lookup-order}

ベーステンプレートの検索順序は、それが適用されるテンプレート (たとえば、 `_default/list.html`) の順序に厳密に従います

詳細と例については、[テンプレート検索順序](/templates/lookup-order/) を参照してください。

## ベーステンプレートを定義する {#define-the-base-template}

以下では、 `_default/baseof.html` でシンプルなベーステンプレート定義しています。デフォルトのテンプレートとして、検索順序の先頭により近い別の `*baseof.html` を指定しない限り、このテンプレートがすべてのページのレンダリング元となるシェルとなります。

{{< code file="layouts/_default/baseof.html" download="baseof.html" >}}
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ block "title" . }}
      <!-- ブロックは、デフォルトのコンテンツを含む場合があります。 -->
      {{ .Site.Title }}
    {{ end }}</title>
  </head>
  <body>
    <!-- ヘッダーなど、すべてのテンプレートが共有するコード -->
    {{ block "main" . }}
      <!-- テンプレート間で差異が生じ始めるページの部分 -->
    {{ end }}
    {{ block "footer" . }}
    <!-- より多くの共有コード、おそらくフッターですが、必要に応じてオーバーライドできます  -->
    {{ end }}
  </body>
</html>
{{< /code >}}

## ベーステンプレートをオーバーライドする {#override-the-base-template}

上記のベーステンプレートから、[デフォルトのリストテンプレート][hugolists] を定義できます。デフォルトのリストテンプレートは上で定義されたすべてのコードを継承し、以下から独自の `"main"` ブロックを実装できます。

{{< code file="layouts/_default/list.html" download="list.html" >}}
{{ define "main" }}
  <h1>Posts</h1>
  {{ range .Pages }}
    <article>
      <h2>{{ .Title }}</h2>
      {{ .Content }}
    </article>
  {{ end }}
{{ end }}
{{< /code >}}

これは、(基本的に空の) "main" ブロックの内容を、リストテンプレートに役立つものに置き換えます。この場合、`"title"` ブロックを定義していないので、ベーステンプレートの内容はリスト内で変更されないままです。

{{% warning %}}
ブロック定義の外に置くコードは、レイアウトを壊す可能性があります。 これには HTML コメントも含まれます。 たとえば、以下のコードです。

```go-html-template
<!-- Seemingly harmless HTML comment..that will break your layout at build -->
{{ define "main" }}
...your code here
{{ end }}
```
[Hugo ディスカッション フォーラムのこのスレッド](https://discourse.gohugo.io/t/baseof-html-block-templates-and-list-types-results-in-empty-pages/5612/6) を参照してください。
{{% /warning %}}

以下は、[デフォルトのシングルページ テンプレート][singletemplate] に固有のコードを使用して、ベーステンプレートの `"main"` と `"title"` ブロックエリアの両方をオーバーライドする方法を示しています。

{{< code file="layouts/_default/single.html" download="single.html" >}}
{{ define "title" }}
  <!-- これは、baseof.html で設定されたデフォルト値をオーバーライドします。つまり、元の例では "{{.Site.Title}}" となります。 -->
  {{ .Title }} &ndash; {{ .Site.Title }}
{{ end }}
{{ define "main" }}
  <h1>{{ .Title }}</h1>
  {{ .Content }}
{{ end }}
{{< /code >}}

[hugolists]: /templates/lists
[lookup]: /templates/lookup-order/
[rendering the section]: /templates/section-templates/
[singletemplate]: /templates/single-page-templates/
