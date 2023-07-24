---
aliases: []
categories:
- function
date: "2017-07-26"
description: arg1 > arg2 && arg1 > arg3 の結果をブール値で返します。
draft: false
hugoversion: null
keywords:
- comparison
- operators
- logic
lastmod: "2017-07-26"
menu:
  docs:
    parent: function
publishdate: "2017-07-26"
relatedfuncs: []
signature:
- "gt ARG1 ARG2 [ARG...]"
title: gt
---

```go-html-template
{{ gt 1 1 }} → false
{{ gt 1 2 }} → false
{{ gt 2 1 }} → true

{{ gt 1 1 1 }} → false
{{ gt 1 1 2 }} → false
{{ gt 1 2 1 }} → false
{{ gt 1 2 2 }} → false

{{ gt 2 1 1 }} → true
{{ gt 2 1 2 }} → false
{{ gt 2 2 1 }} → false
```
