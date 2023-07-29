---
categories:
- function
date: "2017-02-01"
description: マップ、配列、スライスをソートし、ソートされたスライスを返します。
draft: false
keywords:
- ordering
- sorting
- lists
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature: ["sort COLLECTION [KEY] [ORDER]"]
title: sort
workson:
- lists
- taxonomies
- terms
- groups
---

KEY` はスライスを昇順にソートする場合はオプションですが、そうでない場合は必須です。
スライスをソートするときは、 `KEY` の代わりに `value` というリテラルを使用します。以下の例を参照してください。

`ORDER` は、`asc` (昇順) または `desc` (降順) のいずれかです。 デフォルトのソート順序は昇順です。

## スライスをソートする {#sort-a-slice}

以下の例では、このサイト設定を前提としています。

{{< code-toggle file="hugo" copy=false >}}
[params]
grades = ['b','a','c']
{{< /code-toggle >}}

### 昇順 {#slice-ascending-order}

次の構成のいずれかを使用して、スライス要素を昇順にソートします (並べ替えます)。

{{< code file="layouts/_default/single.html" copy=false >}}
{{ sort site.Params.grades }} → [a b c]
{{ sort site.Params.grades "value" "asc" }} → [a b c]
{{< /code >}}

上記の例では、`value` はスライス要素の値を表す `KEY` です。

### 降順 {#slice-descending-order}

スライス要素を降順に並べ替えます。

{{< code file="layouts/_default/single.html" copy=false >}}
{{ sort site.Params.grades "value" "desc" }} → [c b a]
{{< /code >}}

上記の例では、`value` はスライス要素の値を表す `KEY` です。

## マップをソートする {#sort-a-map}

以下の例では、このサイト設定を前提としています。

{{< code-toggle file="hugo" copy=false codeId="h2" >}}
[params.authors.a]
firstName = "Marius"
lastName  = "Pontmercy"
[params.authors.b]
firstName = "Victor"
lastName  = "Hugo"
[params.authors.c]
firstName = "Jean"
lastName  = "Valjean"
{{< /code-toggle >}}

{{% note %}}
マップをソートする場合、`KEY` 引数は小文字である必要があります。
{{% /note %}}

### 昇順 {#map-ascending-order}

次のいずれかの構成を使用して、マップ オブジェクトを昇順に並べ替えます。

{{< code file="layouts/_default/single.html" copy=false >}}
{{ range sort site.Params.authors "firstname" }}
  {{ .firstName }}
{{ end }}

{{ range sort site.Params.authors "firstname" "asc" }}
  {{ .firstName }}
{{ end }}
{{< /code >}}

上記のコードは、以下を生成します。

```text
Jean Marius Victor
```

### 降順 {#map-descending-order}

マップ オブジェクトを降順に並べ替えます。

{{< code file="layouts/_default/single.html" copy=false >}}
{{ range sort site.Params.authors "firstname" "desc" }}
  {{ .firstName }}
{{ end }}
{{< /code >}}

上記のコードは、以下を生成します。

```text
Victor Marius Jean
```

## ページコレクションを並べ替える {#sort-a-page-collection}

ページコレクションをソートするには `sort` 関数を使いますが、Hugo は、以下の項目で [ページコレクションをソートするための組み込みメソッド]
[built-in methods for sorting page collections] を提供しています。

- weight
- linktitle
- title
- front matter parameter
- date
- expiration date
- last modified date
- publish date
- length

この作為的な例では、サイトの通常ページを `.Type` の降順でソートします。

{{< code file="layouts/_default/home.html" copy=false >}}
{{ range sort site.RegularPages "Type" "desc" }}
  <h2><a href="{{ .RelPermalink }}">{{ .Title }}</a></h2>
{{ end }}
{{< /code >}}

[built-in methods for sorting page collections]: /templates/lists/#order-content
