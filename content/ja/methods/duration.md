---
title: duration
description: 指定された時間単位と継続時間の値を使用して、 `time.Duration` 構造体を返します。
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [time duration]
signature: ["duration TIME_UNIT DURATION_NUMBER"]
aliases: []
---

`time.Duration` は、指定された数値を [`time.Duration`](https://pkg.go.dev/time#Duration) 構造体に変換して、そのフィールドにアクセスできるようにします。 
たとえば、以下のように、返された `time.Duration` 値に対して [時間操作](https://pkg.go.dev/time#Duration) を実行できます。

```go-html-template
{{ printf "There are %.0f seconds in one day." (duration "hour" 24).Seconds }}
<!-- Output: There are 86400 seconds in one day. -->
```

[チェーン パイプライン](https://pkg.go.dev/text/template#hdr-Pipelines) を使用して、コードを理解しやすくします。

```go-html-template
{{ mul 7.75 60 | duration "minute" }} → 7h45m0s
{{ mul 120 60 | mul 1000 | duration "millisecond" }} → 2h0m0s
```

関数に与えられた数値に対して、時間単位を指定する必要があります。有効な時間単位は以下の通りです。

継続時間 | 有効な時間単位
:--|:--
時間 |`hour`, `h`
分 |`minute`, `m`
秒 |`second`, `s`
ミリ秒 |`millisecond`, `ms`
マイクロ秒 |`microsecond`, `us`, `µs`
ナノ秒 |`nanosecond`, `ns`
