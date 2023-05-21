---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 日付/時刻をローカライズされた文字列に変換します。
draft: false
hugoversion: null
keywords:
- dates
- time
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- Format
- now
- Unix
- time
signature:
- "time.Format LAYOUT INPUT"
- "dateFormat LAYOUT INPUT"
title: time.Format
workson: []
---

`time.Format` (別名 `dateFormat`) は、 `time.Time` オブジェクト (たとえば、 `.Date`) またはタイムスタンプ文字列 `INPUT` を `LAYOUT` 文字列で指定された形式に変換します。

```go-html-template
{{ time.Format "Monday, Jan 2, 2006" "2015-01-21" }} → "Wednesday, Jan 21, 2015"
```

`time.Format` は、現在の言語用にローカライズされた文字列を返します。

`LAYOUT` 文字列は、以下のいずれかになります。

* [Go のレイアウト文字列](/functions/format/#gos-layout-string) で `LAYOUT` 文字列がどのようにフォーマットしなければならないかを学びます。また、いくつかの有用な例もあります。
* Hugo レイアウトのカスタム識別子 (以下の全リストを参照してください)。

タイムスタンプ文字列を Go の `time.Time` 型の値に変換するには、[`time` 関数](/functions/time/) を参照してください。


## 日付/時刻のフォーマット レイアウト {#datetime-formatting-layouts}

Go の日付レイアウト文字列は、特に複数の言語を使用する場合、理由を説明するのが難しい場合があります。 Hugo 0.87.0 以降では、ローカライズされた日付または時刻を出力する定義済みのレイアウト識別子を代わりに使用できます。

```go-html-template
{{ .Date | time.Format ":date_long" }}
```

以下は、英語版のカスタム レイアウトの全リストとサンプルです。

* `:date_full` => `Wednesday, June 6, 2018`
* `:date_long` => `June 6, 2018`
* `:date_medium` => `Jun 6, 2018`
* `:date_short` => `6/6/18`

* `:time_full` => `2:09:37 am UTC`
* `:time_long` => `2:09:37 am UTC`
* `:time_medium` => `2:09:37 am`
* `:time_short` => `2:09 am`
