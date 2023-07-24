---
categories:
- function
date: "2017-02-01"
description: 指定された文字列内のすべての文字を小文字に変換します。
draft: false
keywords:
- strings
- casing
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "lower INPUT"
- "strings.ToLower INPUT"
title: lower
---

`lower` は複数の方法でテンプレートに適用できることに注意してください。

```go-html-template
{{ lower "BatMan" }} → "batman"
{{ "BatMan" | lower }} → "batman"
```
