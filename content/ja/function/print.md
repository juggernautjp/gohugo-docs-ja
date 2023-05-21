---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 標準の `fmt.Print` 関数を使用して、指定された引数のデフォルト表現を出力します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
linktitle: print
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- print INPUT
title: print
workson: []
---

詳細については、[go ドキュメント](https://golang.org/pkg/fmt/) を参照してください。

```go-html-template
{{ print "foo" }} → "foo"
{{ print "foo" "bar" }} → "foobar"
{{ print (slice 1 2 3) }} → [1 2 3]
```
