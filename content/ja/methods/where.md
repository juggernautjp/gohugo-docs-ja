---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定されたフィールドにマッチする値を含む要素のみに配列をフィルタリングします。
draft: false
hugoversion: null
keywords:
- filtering
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
needsexample: true
publishdate: "2017-02-01"
relatedfuncs:
- intersect
- first
- after
- last
signature:
- where COLLECTION KEY [OPERATOR] MATCH
title: where
toc: true
workson:
- lists
- taxonomies
- terms
- groups
---

`where` は、指定したフィールドに一致する値を含む要素のみに配列をフィルタリングします。

[SQL の `where` キーワード][wherekeyword] と同じように機能します。

```go-html-template
{{ range where .Pages "Section" "foo" }}
  {{ .Content }}
{{ end }}
```

第 2 引数をドットチェインすることで、値のネストした要素を参照することができます。

```yaml
+++
series: golang
+++
```

```go-html-template
{{ range where .Site.Pages "Params.series" "golang" }}
   {{ .Content }}
{{ end }}
```

また、論理演算子 `!=`、`>=`、`in` などと一緒に使用することもできます。 演算子がない場合、`where` は指定されたフィールドを `=` に相当する一致する値と比較します。

```go-html-template
{{ range where .Pages "Section" "!=" "foo" }}
   {{ .Content }}
{{ end }}
```

`where` では、以下の論理演算子を使用できます。

`=`, `==`, `eq`
: 指定されたフィールド値がマッチする値と等しい場合、`true` となります。

`!=`, `<>`, `ne`
: 指定されたフィールド値がマッチする値と等しくない場合、 `true` となります。

`>=`, `ge`
: 指定されたフィールド値がマッチする値より大きいか等しい場合、 `true` となります。

`>`, `gt`
: 指定されたフィールド値がマッチする値よりも大きい場合、 `true` となります。

`<=`, `le`
: 指定されたフィールド値がマッチする値より小さいか等しい場合、 `true` となります。

`<`, `lt`
: 指定されたフィールド値が、マッチする値よりも小さい場合、 `true` となります。

`in`
: 指定されたフィールド値がマッチする値に含まれる場合、 `true` となります。ただし、マッチする値は配列かスライスでなければなりません。

`not in`
: 指定されたフィールド値がマッチする値に含まれない場合、 `true` となります。ただし、マッチする値は配列かスライスでなければなりません。

`intersect`
: 文字列または整数のスライス/配列である与えられたフィールド値が、マッチする値と共通する要素を含んでいる場合、 `true` となります。 つまり、[`intersect` 関数][intersect] と同じルールに従います。

## `where` を `Booleans` と共に使用する {#use-where-with-booleans}

ブール値をを使用する場合は、引用符を付けないでください。

```go-html-template
{{range where .Pages "Draft" true}}
        <p>{{.Title}}</p>
{{end}}
```


## `where` を `intersect` と共に使用する {#use-where-with-intersect}

```go-html-template
{{ range where .Site.Pages "Params.tags" "intersect" .Params.tags }}
  {{ if ne .Permalink $.Permalink }}
    {{ .Render "summary" }}
  {{ end }}
{{ end }}
```

また、以下のように、`where` 句の戻り値を変数に入れることもできます。

{{< code file="where-intersect-variables.html" >}}
{{ $v1 := where .Site.Pages "Params.a" "v1" }}
{{ $v2 := where .Site.Pages "Params.b" "v2" }}
{{ $filtered := $v1 | intersect $v2 }}
{{ range $filtered }}
{{ end }}
{{< /code >}}

## `where` を `first` と共に使用する {#use-where-with-first}

`first` と `where` を一緒に使うと、とても強力です。 以下のスニペットは、[**メインセクション**]({{< relref "where.md#mainsections" >}}) からのみ投稿のリストを取得し、リストの [デフォルトの順序付け](/templates/lists/) を使ってソートし (つまり、 `weight => date`)、そのリストの最初の 5 個の投稿だけを対象とします。

{{< code file="first-and-where-together.html" >}}
{{ range first 5 (where site.RegularPages "Type" "in" site.Params.mainSections) }}
   {{ .Content }}
{{ end }}
{{< /code >}}

## `where` 句をネストする {#nest-where-Clauses}

`where` 句をネストして、コンテンツのリストを複数のパラメータでドリルダウンすることもできます。 以下の例では、まず "blog" セクションのすべてのページを取得し、次に最初の `where` 句の結果を範囲指定して、注目されて *いない* すべてのページを見つけます。

```go-html-template
{{ range where (where .Pages "Section" "blog" ) "Params.featured" "!=" true }}
```

## 未設定のフィールド {#unset-fields}

フィルタリングは、設定されたフィールドに対してのみ機能します。 フィールドが設定されているか存在するかを確認するには、オペランド `nil` を使用できます。

これは、大きなプールから少量のページをフィルタリングするのに役立ちます。 すべてのページにフィールドを設定する代わりに、必要なページだけにそのフィールドを設定できます。

`nil` に対しては、以下の演算子のみが利用可能です。

* `=`, `==`, `eq`: 指定されたフィールドが設定されていない場合は、 true 。
* `!=`, `<>`, `ne`: 指定されたフィールドが設定されている場合は、 true 。

```go-html-template
{{ range where .Pages "Params.specialpost" "!=" nil }}
   {{ .Content }}
{{ end }}
```

## ポータブルな `where` フィルタ -- `site.Params.mainSections` {#mainsections}

**これはテーマにとって特に重要です。**

フロントページなどで最も関連性の高いページを一覧表示するには、セクション名を `"posts"` や `"post"` といったハードコードされた値と比較するのではなく、 `site.Params.mainSections` リストを使用する必要があります。

```go-html-template
{{ $pages := where site.RegularPages "Type" "in" site.Params.mainSections }}
```

ユーザーがサイト設定でこの設定パラメータを設定していない場合、デフォルトで *最もページ数の多いセクション* に設定されます。

ユーザーは、以下のように、デフォルトをオーバーライドできます。

{{< code-toggle file="config" >}}
[params]
  mainSections = ["blog", "docs"]
{{< /code-toggle >}}

[intersect]: /functions/intersect/
[wherekeyword]: https://www.techonthenet.com/sql/where.php
