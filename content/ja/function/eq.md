---
aliases: []
categories:
- function
date: "2017-02-01"
description: arg1 == arg2 || arg1 == arg3 の結果をブール値で返します。
draft: false
keywords:
- comparison
- operators
- logic
lastmod: "2017-02-01"
linktitle: eq
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "eq ARG1 ARG2 [ARG...]"
title: eq
---


```go-html-template
{{ eq 1 1 }} → true
{{ eq 1 2 }} → false

{{ eq 1 1 1 }} → true
{{ eq 1 1 2 }} → true
{{ eq 1 2 1 }} → true
{{ eq 1 2 2 }} → false
```
