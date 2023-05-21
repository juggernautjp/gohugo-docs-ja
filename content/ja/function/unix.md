---
categories:
- functions
date: "2017-02-01"
description: time.Time 値を Unix エポックからの経過秒数 (うるう秒を除く) に変換します。 Unix エポックは、1970年1月1日の 00:00:00&nbsp; UTC です。
draft: false
keywords:
- dates
- time
menu:
  docs:
    parent: functions
relatedfuncs:
- Format
- dateFormat
- now
- time
signature:
- .Unix
- .UnixMilli
- .UnixMicro
- .UnixNano
title: .Unix
---

`Milli`、`Micro`、および `Nano` バリアントは、 (それぞれ) Unix エポックから経過したミリ秒、マイクロ秒、およびナノ秒の数を返します。

```go-html-template
.Date.Unix        --> 1637259694
.ExpiryDate.Unix  --> 1672559999
.Lastmod.Unix     --> 1637361786
.PublishDate.Unix --> 1637421261

("1970-01-01T00:00:00-00:00" | time.AsTime).Unix --> 0
("1970-01-01T00:00:42-00:00" | time.AsTime).Unix --> 42
("1970-04-11T01:48:29-08:00" | time.AsTime).Unix --> 8675309
("2026-05-02T20:09:31-07:00" | time.AsTime).Unix --> 1777777771

now.Unix      --> 1637447841
now.UnixMilli --> 1637447841347
now.UnixMicro --> 1637447841347378
now.UnixNano  --> 1637447841347378799
```
