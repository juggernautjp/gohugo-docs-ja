---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: ある要素が配列またはスライス、または文字列の部分文字列に含まれるかどうかを調べ、ブール値を返します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
linktitle: null
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- in SET ITEM
title: in
workson: []
---

サポートされている要素は文字列、整数、浮動小数点数ですが、期待どおりに一致するのは float64 のみです。

さらに、`in` は、文字列の中に部分文字列が存在するかどうかを調べることもできます。

```go-html-template
{{ if in .Params.tags "Git" }}Follow me on GitHub!{{ end }}
```


```go-html-template
{{ if in "this string contains a substring" "substring" }}Substring found!{{ end }}
```
