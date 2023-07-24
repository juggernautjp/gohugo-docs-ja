---
categories:
- function
date: "2017-02-01"
description: 指定された配列またはスライスのランダム置換を返します。
draft: false
keywords:
- ordering
lastmod: "2017-04-30"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- seq
signature:
- shuffle COLLECTION
title: shuffle
---

```go-html-template
{{ shuffle (seq 1 2 3) }} → [3 1 2] 
{{ shuffle (slice "a" "b" "c") }} → [b a c] 
```

結果はビルドごとに異なります。
