---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 単語を切り捨てたり、閉じていない HTML タグを残さずに、テキストを最大長まで切り詰めます。
draft: false
hugoversion: 19
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "truncate SIZE [ELLIPSIS] INPUT"
- "strings.Truncate SIZE [ELLIPSIS] INPUT"
title: truncate
workson: []
---

Go テンプレートは HTML に対応しているため、`truncate` は通常の文字列と HTML 文字列をインテリジェントに処理します。

```go-html-template
{{ "<em>Keep my HTML</em>" | safeHTML | truncate 10 }}` → <em>Keep my …</em>`
```

{{% note %}}
HTML として扱いたい HTML タグを含む生の文字列がある場合、値を truncate に送る前に、[`safeHTML` テンプレート関数](/functions/safehtml) を使用して文字列を HTML に変換する必要があります。そうしないと、 `truncate` 関数に渡されたときに HTML タグがエスケープされてしまいます。
{{% /note %}}
