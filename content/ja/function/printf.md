---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 標準の `fmt.Sprintf` 関数を使用して、文字列をフォーマットします。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
linktitle: printf
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- printf FORMAT INPUT
title: printf
workson: []
---

詳細については、[go ドキュメント](https://golang.org/pkg/fmt/) を参照してください。

```go-html-template
{{ i18n ( printf "combined_%s" $var ) }}
```

```go-html-template
{{ printf "formatted %.2f" 3.1416 }}
```
