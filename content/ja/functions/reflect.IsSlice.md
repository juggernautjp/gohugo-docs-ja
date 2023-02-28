---
categories:
- functions
date: "2018-11-28"
deprecated: false
description: 値がスライスであるかどうかを報告します。
draft: false
hugoversion: "0.53"
keywords:
- reflect
- reflection
- kind
lastmod: "2018-11-28"
menu:
  docs:
    parent: functions
publishdate: "2018-11-28"
relatedfuncs:
- reflect.IsMap
signature:
- reflect.IsSlice INPUT
title: reflect.IsSlice
workson: []
---

`reflect.IsSlice` は、`VALUE` がスライスであるかどうかを報告し、ブール値を返します。

```go-html-template
{{ reflect.IsSlice (slice 1 2 3) }} → true
{{ reflect.IsSlice "yo" }} → false
```
