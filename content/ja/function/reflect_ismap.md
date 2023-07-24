---
categories:
- function
date: "2018-11-28"
description: 値がマップであるかどうかを報告します。
draft: false
keywords:
- reflect
- reflection
- kind
lastmod: "2018-11-28"
menu:
  docs:
    parent: function
publishdate: "2018-11-28"
relatedfuncs:
- reflect.IsSlice
signature:
- reflect.IsMap INPUT
title: reflect.IsMap
---

`reflect.IsMap` は、`VALUE` がマップであるかどうかを報告し、ブール値を返します。

```go-html-template
{{ reflect.IsMap (dict "key" "value") }} → true
{{ reflect.IsMap "yo" }} → false
```
