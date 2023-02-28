---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: HTML を除去し、指定された文字列のプレーンテキスト版を返します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-04-30"
linktitle: plainify
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- jsonify
signature:
- plainify INPUT
title: plainify
workson: []
---

```go-html-template
{{ "<b>BatMan</b>" | plainify }} → "BatMan"
```

`.PlainWords`、`.Plain`、`.RawContent` [ページ変数][pagevars] も参照してください。

[pagevars]: /variables/page/
