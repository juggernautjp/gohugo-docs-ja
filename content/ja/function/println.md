---
categories:
- function
date: "2017-02-01"
description: 標準の `fmt.Print` 関数を使用して、指定された引数のデフォルト表現を出力し、改行を強制します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- println INPUT
title: println
---

詳細については、[go ドキュメント](https://golang.org/pkg/fmt/) を参照してください。
`\n` は改行を示しますが、以下に示すようにテンプレートには表示されません。

```go-html-template
{{ println "foo" }} → "foo\n"
```
