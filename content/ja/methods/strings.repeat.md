---
categories:
- functions
date: "2018-05-31"
deprecated: false
description: INPUT を COUNT 回繰り返したものを返します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2018-05-31"
menu:
  docs:
    parent: functions
publishdate: "2018-05-31"
relatedfuncs: []
signature:
- strings.Repeat COUNT INPUT
title: strings.Repeat
workson: []
---

```go-html-template
{{ strings.Repeat 3 "yo" }} → "yoyoyo"
{{ "yo" | strings.Repeat 3 }} → "yoyoyo"
```
