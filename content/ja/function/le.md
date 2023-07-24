---
categories:
- function
date: "2017-07-26"
description: arg1 <= arg2 && arg1 <= arg3 の結果をブール値で返します。
draft: false
hugoversion: null
keywords:
- operators
- logic
lastmod: "2017-07-26"
menu:
  docs:
    parent: function
publishdate: "2017-07-26"
relatedfuncs: []
signature:
- "le ARG1 ARG2 [ARG...]"
title: le
---

```go-html-template
{{ le 1 1 }} → true
{{ le 1 2 }} → true
{{ le 2 1 }} → false

{{ le 1 1 1 }} → true
{{ le 1 1 2 }} → true
{{ le 1 2 1 }} → true
{{ le 1 2 2 }} → true

{{ le 2 1 1 }} → false
{{ le 2 1 2 }} → false
{{ le 2 2 1 }} → false
```
