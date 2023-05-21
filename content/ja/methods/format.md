---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 組み込みの Hugo の日付 (`Date`、`.PublishDate`、`.Lastmod`) を、Go のレイアウト文字列に従ってフォーマットします。
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
- dateFormat
- now
- Unix
- time
signature:
- .Format FORMAT
title: .Format
toc: true
workson:
- times
---

`.Format` はフロントマターで定義された日付の値をフォーマットし、以下の [ページ変数][pagevars] のプロパティとして使用できます。

* `.PublishDate`
* `.Date`
* `.Lastmod`

コンテンツファイルのフロントマターに `date: 2017-03-03` というキー値があると仮定すると、ビルド時に `.Format` を通して日付を実行し、レイアウト文字列を指定して希望する出力を行うことができます。

```go-html-template
{{ .PublishDate.Format "January 2, 2006" }} => March 3, 2017
```

フロントマターで定義された日付の *任意* の文字列表現をフォーマットするには、[`dateFormat` 関数][dateFormat] を参照してください。 これは、以下で説明する Go レイアウト文字列を引き続き利用しますが、少し異なる構文を使用します。

## Go のレイアウト文字列 {#gos-layout-string}

Hugo テンプレートは、特定の参照時間を指すレイアウト文字列を介して [日付をフォーマット][time] します。

```
Mon Jan 2 15:04:05 MST 2006
```

これは恣意的に見えるかもしれませんが、`MST` の数値は `07` なので、レイアウト文字列は一連の数字になります。

以下は、 [Go ドキュメントから直接引用した][gdex] 視覚的な説明です。

```
 Jan 2 15:04:05 2006 MST
=> 1 2  3  4  5    6  -7
```

### Hugo の日付と時刻のテンプレートのリファレンス {#hugo-date-and-time-templating-reference}

以下の例では、レイアウト文字列とそのレンダリングされた出力が表示されています。

この例は、[CST][] でレンダリングとテストを行い、以下のような、すべてコンテンツファイルのフロントマターの同じフィールドを指しています。

```
date: 2017-03-03T14:15:59-06:00
```

`.Date` (つまり、[ページ変数][pagevars] を介して呼び出されます)
: **戻り値**: `2017-03-03 14:15:59 -0600 CST`

`"Monday, January 2, 2006"`
: **戻り値**: `Friday, March 3, 2017`

`"Mon Jan 2 2006"`
: **戻り値**: `Fri Mar 3 2017`

`"January 2006"`
: **戻り値**: `March 2017`

`"2006-01-02"`
: **戻り値**: `2017-03-03`

`"Monday"`
: **戻り値**: `Friday`

`"02 Jan 06 15:04 MST"` (RFC822)
: **戻り値**: `03 Mar 17 14:15 CST`

`"02 Jan 06 15:04 -0700"` (RFC822Z)
: **戻り値**: `03 Mar 17 14:15 -0600`

`"Mon, 02 Jan 2006 15:04:05 MST"` (RFC1123)
: **戻り値**: `Fri, 03 Mar 2017 14:15:59 CST`

`"Mon, 02 Jan 2006 15:04:05 -0700"` (RFC1123Z)
: **戻り値**: `Fri, 03 Mar 2017 14:15:59 -0600`

その他の例は、Go の [time パッケージのドキュメント][timeconst] で見つけることができます。

### 基数と序数の略語 {#cardinal-numbers-and-ordinal-abbreviations}

スペルアウトされた (略すことなく字をつづった) 基数 (たとえば、"one"、"two"、"three") には、現在対応していません。

序数の略語 (つまり、"1st"、"2nd"、"3rd" といった短縮形のサフィックス) は、現在のところ直接的にはサポートされていません。 `{{.Date.Format "Jan 2nd 2006"}}` を使用すると、Hugo は月の日に文字列として `nd` を追加することを想定しています。 ただし、関数を連結して、以下のようなものを作成できます。

```go-html-template
{{ .Date.Format "2" }}{{ if in (slice 1 21 31) .Date.Day}}st{{ else if in (slice 2 22) .Date.Day}}nd{{ else if in (slice 3 23) .Date.Day}}rd{{ else }}th{{ end }} of {{ .Date.Format "January 2006" }}
```

上記のコードは、以下が出力されます。

```
5th of March 2017
```


### `.Local` と `.UTC` を使用する {#use-local-and-utc}

また、[`dateFormat` 関数][dateFormat] と組み合わせて、日付を `UTC` やローカル タイムゾーンに変換することもできます。

`{{ dateFormat "02 Jan 06 15:04 MST" .Date.UTC }}`
: **戻り値**: `03 Mar 17 20:15 UTC`

`{{ dateFormat "02 Jan 06 15:04 MST" .Date.Local }}`
: **戻り値**: `03 Mar 17 14:15 CST`

[CST]: https://en.wikipedia.org/wiki/Central_Time_Zone
[dateFormat]: /functions/dateformat/
[gdex]: https://golang.org/pkg/time/#example_Time_Format
[pagevars]: /variables/page/
[time]: https://golang.org/pkg/time/
[timeconst]: https://golang.org/pkg/time/#ANSIC
