---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された time.Time 値に、指定された年数、月数、および日数を加算した時間を返します。
draft: false
hugoversion: null
keywords:
- dates
- time
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- now
signature:
- .AddDate YEARS MONTHS DAYS
title: .AddDate
workson:
- times
---

```go-html-template
{{ $d := "2022-01-01" | time.AsTime }}

{{ $d.AddDate 0 0 1 | time.Format "2006-01-02" }} --> 2022-01-02
{{ $d.AddDate 0 1 1 | time.Format "2006-01-02" }} --> 2022-02-02
{{ $d.AddDate 1 1 1 | time.Format "2006-01-02" }} --> 2023-02-02

{{ $d.AddDate -1 -1 -1 | time.Format "2006-01-02" }} --> 2020-11-30
```

{{% note %}}
月または年を追加するとき、結果の日が存在しない場合、Hugo は最終的な `time.Time` 値を正規化します。 たとえば、1 月 31 日に 1 か月を追加すると、年によって 3 月 2 日または 3 月 3 日になります。

Go チームによる [この説明](https://github.com/golang/go/issues/31145#issuecomment-479067967) を参照してください。
{{% /note %}}

```go-html-template
{{ $d := "2023-01-31" | time.AsTime }}
{{ $d.AddDate 0 1 0 | time.Format "2006-01-02" }} --> 2023-03-03

{{ $d := "2024-01-31" | time.AsTime }}
{{ $d.AddDate 0 1 0 | time.Format "2006-01-02" }} --> 2024-03-02

{{ $d := "2024-02-29" | time.AsTime }}
{{ $d.AddDate 1 0 0 | time.Format "2006-01-02" }} --> 2025-03-01
```
