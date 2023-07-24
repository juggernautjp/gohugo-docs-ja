---
categories:
- function
date: "2017-02-01"
description: HTML を除去し、指定された文字列のプレーンテキスト版を返します。
draft: false
keywords:
- strings
lastmod: "2017-04-30"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- jsonify
signature:
- plainify INPUT
title: plainify
---

```go-html-template
{{ "<b>BatMan</b>" | plainify }} → "BatMan"
```

`.PlainWords`、`.Plain`、`.RawContent` [ページ変数][pagevars] も参照してください。

[pagevars]: /variables/page/
