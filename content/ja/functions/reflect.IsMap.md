---
categories:
- functions
date: "2018-11-28"
deprecated: false
description: 値がマップであるかどうかを報告します。
draft: false
hugoversion: v0.53
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
- reflect.IsSlice
signature:
- reflect.IsMap INPUT
title: reflect.IsMap
workson: []
---

`reflect.IsMap` は、`VALUE` がマップであるかどうかを報告し、ブール値を返します。

```go-html-template
{{ reflect.IsMap (dict "key" "value") }} → true
{{ reflect.IsMap "yo" }} → false
```
