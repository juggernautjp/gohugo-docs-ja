---
categories:
- function
date: "2017-09-28"
description: 関数に渡された引数から浮動小数点数 `float` を作成します。
draft: false
keywords:
- cast
- strings
- floats
lastmod: "2017-09-28"
linktitle: float
menu:
  docs:
    parent: function
publishdate: "2017-09-28"
relatedfuncs: []
signature:
- float INPUT
title: float
---

10 進数 (基数 10) 入力の場合は、以下のようになります。

```go-html-template
{{ float 11 }} → 11 (float64)
{{ float "11" }} → 11 (float64)

{{ float 11.1 }} → 11.1 (float64)
{{ float "11.1" }} → 11.1 (float64)

{{ float 11.9 }} → 11.9 (float64)
{{ float "11.9" }} → 11.9 (float64)
```

2 進数 (基数 2) 入力の場合は、以下のようになります。

```go-html-template
{{ float 0b11 }} → 3 (float64)
```

8進数 (基数 8) 入力の場合 (どちらの表記でも可)、以下のようになります。

```go-html-template
{{ float 011 }} → 9 (float64)
{{ float "011" }} → 11 (float64)

{{ float 0o11 }} → 9 (float64)
```

16 進数 (基数 16) 入力の場合、以下のようになります。

```go-html-template
{{ float 0x11 }} → 17 (float64)
```
