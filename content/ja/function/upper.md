---
aliases: []
categories:
- function
date: "2017-02-01"
description: 文字列内のすべての文字を大文字に変換します。
draft: false
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "upper INPUT"
- "strings.ToUpper INPUT"
title: upper
toc: null
---

`upper` は、以下のように、複数の方法でテンプレートに適用できることに注意してください。

```go-html-template
{{ upper "BatMan" }} → "BATMAN"
{{ "BatMan" | upper }} → "BATMAN"
```
