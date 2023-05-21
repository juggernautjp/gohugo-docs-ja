---
aliases: []
categories:
- functions
date: "2018-09-14"
description: '`append` は、スライスに 1 つ以上の値を追加し、結果のスライスを返す。'
draft: false
hugoversion: "0.49"
keywords:
- collections
menu:
  docs:
    parent: functions
relatedfuncs:
- last
- first
- where
- slice
signature:
- COLLECTION | append VALUE [VALUE]...
- COLLECTION | append COLLECTION
title: append
workson: []
---

以下は、単一の値を追加する例です。

```go-html-template
{{ $s := slice "a" "b" "c" }}
{{ $s = $s | append "d" "e" }}
{{/* $s now contains a []string with elements "a", "b", "c", "d", and "e" */}}

```

以下は、同じようにスライスにスライスを追加する例です。

```go-html-template
{{ $s := slice "a" "b" "c" }}
{{ $s = $s | append (slice "d" "e") }}
```

`append` 関数は、 `Pages` を含むすべてのタイプで機能します。
