---
categories:
- function
date: "2017-02-01"
description: 任意の配列、スライス、マップをループし、すべての値を区切り文字で区切った文字列を返します。
draft: false
keywords:
- iteration
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- delimit COLLECTION DELIMIT LAST
title: delimit
---

スライスを区切ります。

```go-html-template
{{ $s := slice "b" "a" "c" }}
{{ delimit $s ", " }} → "b, a, c"
{{ delimit $s ", " " and "}} → "b, a and c"
```

マップを区切ります。

{{% note %}}
`delimit` 関数は、マップをキーでソートして値を返します。
{{% /note %}}

```go-html-template
{{ $m := dict "b" 2 "a" 1 "c" 3 }}
{{ delimit $m ", " }} → "1, 2, 3"
{{ delimit $m ", " " and "}} → "1, 2 and 3"
```
