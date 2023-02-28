---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列内のすべての文字を小文字に変換します。
draft: false
hugoversion: null
keywords:
- strings
- casing
lastmod: "2017-02-01"
linktitle: lower
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "lower INPUT"
- "strings.ToLower INPUT"
title: lower
workson: []
---

`lower` は複数の方法でテンプレートに適用できることに注意してください。

```go-html-template
{{ lower "BatMan" }} → "batman"
{{ "BatMan" | lower }} → "batman"
```
