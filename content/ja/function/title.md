---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列内のすべての文字をタイトルケースに変換します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "title INPUT"
- "strings.Title INPUT"
title: title
workson: []
---


```go-html-template
{{title "BatMan"}}` → "Batman"
```

title は、パイプで結合することができます。 以下のスニペットでは、 `humanize` を使ってダッシュを取り除き、 `title` を使って `$name` の値をイニシャルキャップ [^1] に変換して、リンクテキストをクリーンアップしています。

```go-html-template
{{ range $name, $items := .Site.Taxonomies.categories }}
    <li><a href="{{ printf "%s/%s" "categories" ($name | urlize | lower) | absURL }}">{{ $name | humanize | title }} ({{ len $items }})</a></li>
{{ end }}
```

## タイトルケースを設定する {#configure-title-case}

デフォルトは『AP スタイルブック』 [^2] ですが、タイトルケース [^3] を [設定すること](/getting-started/configuration/#configure-title-case) ができます。


## 訳注

[^1]: 各単語の最初の文字を全て大文字にする表記法
[^2]: 米国 のAP 通信が編纂・発行するスタイルガイド
[^3]: 文頭以外の単語もキャピタライズ (大文字に) すること
