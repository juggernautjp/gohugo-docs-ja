---
categories:
- function
date: "2017-02-01"
description: 標準の `fmt.Print` 関数を使用して、指定された引数のデフォルト表現を出力します。
draft: false
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- print INPUT
title: print
---

詳細については、[go ドキュメント](https://golang.org/pkg/fmt/) を参照してください。

```go-html-template
{{ print "foo" }} → "foo"
{{ print "foo" "bar" }} → "foobar"
{{ print (slice 1 2 3) }} → [1 2 3]
```
