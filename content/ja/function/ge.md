---
categories:
- function
date: "2017-07-26"
description: arg1 >= arg2 && arg1 >= arg3 の結果をブール値で返します。
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
- "ge ARG1 ARG2 [ARG...]"
title: ge
---

```go-html-template
{{ ge 1 1 }} → true
{{ ge 1 2 }} → false
{{ ge 2 1 }} → true

{{ ge 1 1 1 }} → true
{{ ge 1 1 2 }} → false
{{ ge 1 2 1 }} → false
{{ ge 1 2 2 }} → false

{{ ge 2 1 1 }} → true
{{ ge 2 1 2 }} → true
{{ ge 2 2 1 }} → true
```
