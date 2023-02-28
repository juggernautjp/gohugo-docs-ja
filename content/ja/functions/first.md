---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 配列を最初の _N_ 個の要素だけにスライスします。
draft: false
hugoversion: null
keywords:
- iteration
lastmod: "2017-02-01"
linktitle: first
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- after
- last
signature:
- first LIMIT COLLECTION
title: first
workson:
- lists
- taxonomies
- terms
- groups
---

`first` は， [SQL の `limit` キーワード][limitkeyword] と似たような働きをします。 これは、配列を `先頭の N` 個の要素だけにします。 入力として、配列と要素数を受け取ります。

`first` は、以下の 2 つの引数を取ります:
1. `要素数`
2. `配列` *または* `マップまたは構造体のスライス`

{{< code file="layout/_default/section.html" >}}
{{ range first 10 .Pages }}
    {{ .Render "summary" }}
{{ end }}
{{< /code >}}

*注意: `first` 以外に、LIMIT を '0' にすると空の配列を返します。*

## `first` と `where` を一緒に使用する {#first-and-where-together}

`first` と [`where`][wherefunction] を一緒に使うと、非常に強力です。 以下のスニペットは、[**メインセクション**][mainsections] から投稿のリストを取得し、 `title` パラメータでソートし、そのリストの最初の 5 件だけを範囲指定します。

{{< code file="first-and-where-together.html" >}}
{{ range first 5 (where site.RegularPages "Type" "in" site.Params.mainSections).ByTitle }}
   {{ .Content }}
{{ end }}
{{< /code >}}


[limitkeyword]: https://www.techonthenet.com/sql/select_limit.php
[wherefunction]: /functions/where/
[mainsections]: /functions/where/#mainsections
