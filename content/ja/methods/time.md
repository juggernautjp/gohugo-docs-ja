---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: タイムスタンプ文字列を `time.Time` 構造体に変換します。
draft: false
hugoversion: v0.77.0
keywords:
- dates
- time
- location
lastmod: "2017-02-01"
linktitle: null
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- time INPUT [TIMEZONE]
title: time
workson: []
---


`time` は、オプションでデフォルトの場所を指定できるタイムスタンプ文字列を [`time.Time`](https://godoc.org/time#Time) 構造体に変換し、そのフィールドにアクセスできるようにします。

```go-html-template
{{ time "2016-05-28" }} → "2016-05-28T00:00:00Z"
{{ (time "2016-05-28").YearDay }} → 149
{{ mul 1000 (time "2016-05-28T10:30:00.00+10:00").Unix }} → 1464395400000、またはミリ秒単位の Unix 時間
```

## ロケーションを使用する {#using-locations}

オプションの `TIMEZONE` パラメータは、指定された時間値に関連するデフォルトのタイムゾーン (または、より具体的には、地理的領域内の時間オフセットのコレクションを表す場所) を設定する文字列です。 時間値に明示的なタイムゾーンまたはオフセットが指定されている場合は、 `TIMEZONE` パラメータよりもそちらが優先されます。

有効な場所のリストはシステムに依存しますが、`UTC`、`Local`、または [IANA タイムゾーン データベース](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) にある任意の場所を含める必要があります。

`TIMEZONE` が設定されていない場合、サイト設定の `timeZone` が使用されます。

```go-html-template
{{ time "2020-10-20" }} → 2020-10-20 00:00:00 +0000 UTC
{{ time "2020-10-20" "America/Los_Angeles" }} → 2020-10-20 00:00:00 -0700 PDT
{{ time "2020-01-20" "America/Los_Angeles" }} → 2020-01-20 00:00:00 -0800 PST
```

## 例: `time` を使用して、月のインデックスを取得する {#example-using-time-to-get-month-index}

以下の例では、UNIX タイムスタンプを取得し --- コンテンツのフロントマターで `utimestamp: "1489276800"` として設定します --- タイムスタンプ (文字列) を [`int` 関数][int] を使用して整数に変換し、次に [`printf`][] を使用して `time` の `Month` プロパティをインデックスに変換します。

[多言語サイト][multilingual] を設定する場合、以下のような例が参考になると思います。

{{< code file="unix-to-month-integer.html" >}}
{{$time := time (int .Params.addDate)}}
=> $time = 1489276800
{{$time.Month}}
=> "March"
{{$monthindex := printf "%d" $time.Month }}
=> $monthindex = 3
{{< /code >}}


[int]: /functions/int/
[multilingual]: /content-management/multilingual/
[`printf`]: /functions/printf/
