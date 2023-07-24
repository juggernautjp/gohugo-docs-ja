---
categories:
- function
date: "2017-02-01"
description: 関数に渡された引数から文字列を作成します。
draft: false
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- string INPUT
title: string
---

10 進数 (基数 10) 入力の場合は、以下のようになります。

```go-html-template
{{ string 11 }} → 11 (string)
{{ string "11" }} → 11 (string)

{{ string 11.1 }} → 11.1 (string)
{{ string "11.1" }} → 11.1 (string)

{{ string 11.9 }} → 11.9 (string)
{{ string "11.9" }} → 11.9 (string)
```

2 進数 (基数 2) 入力の場合は、以下のようになります。

```go-html-template
{{ string 0b11 }} → 3 (string)
{{ string "0b11" }} → 0b11 (string)
```

8 進数 (基数 8) 入力の場合 (どちらの表記でも可)、以下のようになります。

```go-html-template
{{ string 011 }} → 9 (string)
{{ string "011" }} → 011 (string)

{{ string 0o11 }} → 9 (string)
{{ string "0o11" }} → 0o11 (string)
```

16 進数 (基数 16) 入力の場合、以下のようになります。

```go-html-template
{{ string 0x11 }} → 17 (string)
{{ string "0x11" }} → 0x11 (string)
```
