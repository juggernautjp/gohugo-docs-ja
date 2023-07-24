---
categories:
- function
date: "2017-07-26"
deprecated: false
description: arg1 != arg2 && arg1 != arg3 の結果をブール値で返します。
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
- "ne ARG1 ARG2 [ARG...]"
title: ne
---

```go-html-template
{{ ne 1 1 }} → false
{{ ne 1 2 }} → true

{{ ne 1 1 1 }} → false
{{ ne 1 1 2 }} → false
{{ ne 1 2 1 }} → false
{{ ne 1 2 2 }} → true
```
