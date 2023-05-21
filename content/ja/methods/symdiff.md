---
aliases: []
categories:
- functions
date: "2018-11-07"
description: '`collections.SymDiff` (別名 `symdiff`) は、2 つのコレクションの対称差を返します。'
draft: false
hugoversion: "0.51"
keywords:
- collections
- intersect
- union
- complement
menu:
  docs:
    parent: functions
signature:
- COLLECTION | symdiff COLLECTION
title: symdiff
---

例:

```go-html-template
{{ slice 1 2 3 | symdiff (slice 3 4) }}
```

上記は、 `[1 2 4]` を出力します。

https://ja.wikipedia.org/wiki/%E5%AF%BE%E7%A7%B0%E5%B7%AE も参照してください。
