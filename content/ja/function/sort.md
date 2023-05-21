---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: マップ、配列、スライスをソートし、ソートされたスライスを返します。
draft: false
hugoversion: null
keywords:
- ordering
- sorting
- lists
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature: []
title: sort
workson:
- lists
- taxonomies
- terms
- groups
---

キーが削除されたマップ値のソートされた配列が返されます。 オプションの引数は、`sortByField` と `sortAsc` の 2 つです。 空白のままにすると、ソートはデフォルトの動作として、キー (マップの場合) の昇順でソートされます。

```ini
---
tags: ["tag3", "tag1", "tag2"]
---

// サイト設定
+++
[params.authors]
  [params.authors.Joe]
    firstName = "Joe"
    lastName  = "Bergevin"
  [params.authors.Derek]
    firstName = "Derek"
    lastName  = "Perkins"
  [params.authors.Tanner]
    firstName = "Tanner"
    lastName  = "Linsley"
+++
```

```js
// 値の昇順でソートする (リストのデフォルト) 
Tags: {{ range sort .Params.tags }}{{ . }} {{ end }}

→ Outputs Tags: tag1 tag2 tag3

// 値の降順でソートする
Tags: {{ range sort .Params.tags "value" "desc" }}{{ . }} {{ end }}

→ Outputs Tags: tag3 tag2 tag1

// キーの昇順でソートする (マップのデフォルト)
Authors: {{ range sort .Site.Params.authors }}{{ .firstName }} {{ end }}

→ Outputs Authors: Derek Joe Tanner

// フィールドの降順でソートする
Authors: {{ range sort .Site.Params.authors "lastName" "desc" }}{{ .lastName }} {{ end }}

→ Outputs Authors: Perkins Linsley Bergevin
```
