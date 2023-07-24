---
aliases: []
categories:
- function
date: "2017-02-01"
description: 関数に渡された引数から `int` を作成します。
draft: false
keywords:
- strings
- integers
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- int INPUT
title: int
---

10 進数 (基数 10) 入力の場合は、以下のようになります。

```go-html-template
{{ int 11 }} → 11 (int)
{{ int "11" }} → 11 (int)

{{ int 11.1 }} → 11 (int)
{{ int 11.9 }} → 11 (int)
```

2 進数 (基数 2) 入力の場合は、以下のようになります。

```go-html-template
{{ int 0b11 }} → 3 (int)
{{ int "0b11" }} → 3 (int)
```

8 進数 (基数 8) 入力の場合 (どちらの表記でも可)、以下のようになります。

```go-html-template
{{ int 011 }} → 9 (int)
{{ int "011" }} → 9 (int)

{{ int 0o11 }} → 9 (int)
{{ int "0o11" }} → 9 (int)
```

16 進数 (基数 16) 入力の場合、以下のようになります。

```go-html-template
{{ int 0x11 }} → 17 (int)
{{ int "0x11" }} → 17 (int)
```

{{% note %}}
先頭にゼロが付いている値は 8 進数 (基数 8) です。 
10 進数 (基数 10) の文字列表現をキャストする場合は、先頭のゼロを削除します。

`{{ strings.TrimLeft "0" "0011" | int }} → 11`
{{% /note %}}
