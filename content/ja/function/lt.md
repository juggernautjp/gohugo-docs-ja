---
categories:
- function
date: "2017-07-26"
description: arg1 < arg2 の結果をブール値で返します。
draft: false
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
- lt ARG1 ARG2
title: lt
---

```go-html-template
{{ lt 1 1 }} → false
{{ lt 1 2 }} → true
{{ lt 2 1 }} → false

{{ lt 1 1 1 }} → false
{{ lt 1 1 2 }} → false
{{ lt 1 2 1 }} → false
{{ lt 1 2 2 }} → true

{{ lt 2 1 1 }} → false
{{ lt 2 1 2 }} → false
{{ lt 2 2 1 }} → false
```
