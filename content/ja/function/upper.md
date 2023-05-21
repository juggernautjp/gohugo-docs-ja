---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 文字列内のすべての文字を大文字に変換します。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "upper INPUT"
- "strings.ToUpper INPUT"
title: upper
toc: null
workson: []
---

`upper` は、以下のように、複数の方法でテンプレートに適用できることに注意してください。

```go-html-template
{{ upper "BatMan" }} → "BATMAN"
{{ "BatMan" | upper }} → "BATMAN"
```
