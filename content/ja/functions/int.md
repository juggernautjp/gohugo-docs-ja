---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 関数に渡された引数から `int` を作成します。
draft: false
hugoversion: null
keywords:
- strings
- integers
lastmod: "2017-02-01"
linktitle: int
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- int INPUT
title: int
workson: []
---

文字列を数値に変換するのに便利です。

```go-html-template
{{ int "123" }} → 123
```

{{% note "Usage Note" %}}
入力文字列が 10 進数を表すと想定されていて、先頭に 0 がある場合、文字列を `int` 関数に渡す前にそれらの 0 を削除する必要があります。そうしないと、その文字列は 8 進数表現としてパースされます。

この目的のためには、[`strings.TrimLeft` 関数](/functions/strings.trimleft/) を使用できます。

```go-html-template
{{ int ("0987" | strings.TrimLeft "0") }}
{{ int ("00987" | strings.TrimLeft "0") }}
```

### 説明 {#explanation}

`int` 関数は、最終的に Go ライブラリの `strconv` から `ParseInt` 関数を呼び出します。

その [ドキュメント](https://golang.org/pkg/strconv/#ParseInt) から引用します。

> 文字列のプレフィックスが基数を示しています。 "0x" の場合は 16 が基数 、"0" の場合は 8 が基数、
> それ以外の場合は 10 を基数とします。
{{% /note %}}
