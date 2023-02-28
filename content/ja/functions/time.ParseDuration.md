---
title: time.ParseDuration
description: 与えられた継続時間文字列を `time.Duration` 構造体にパースします。
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [time parse duration]
signature: ["time.ParseDuration DURATION"]
hugoversion:
aliases: []
---

`time.ParseDuration` は、継続時間文字列を解析して [`time.Duration`](https://pkg.go.dev/time#Duration) 構造体に変換し、そのフィールドにアクセスできるようにします。
継続時間の文字列は、符号付きの 10 進数の列で、それぞれオプションで小数と `300ms`、`-1.5h` 、`2h45m` のような単位のサフィックスをつけることができます。有効な時間単位は `ns`、`us` (または `µs`)、`ms`、`s`、`m`、`h` です。 

返された `time.Duration` 値に対して、以下のように [時間操作](https://pkg.go.dev/time#Duration) を実行できます。

```go-html-template
{{ printf "There are %.0f seconds in one day." (time.ParseDuration "24h").Seconds }}
<!-- Output: There are 86400 seconds in one day. -->
```
