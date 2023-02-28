---
aliases: []
categories:
- functions
date: "2017-09-25"
deprecated: false
description: Parse は、与えられた URL (相対または絶対) を解析し、URL 構造にします。
draft: false
hugoversion: null
keywords:
- urls
lastmod: "2017-09-25"
menu:
  docs:
    parent: functions
publishdate: "2017-09-25"
signature:
- urls.Parse URL
title: urls.Parse
workson: []
---

`urls.Parse` は、 url を入力として受け取ります。


```go-html-template
{{ $url := urls.Parse "http://www.gohugo.io" }}
```

そして、[URL](https://godoc.org/net/url#URL) 構造体を返します。URL 構造体のフィールドには、 `.` 記法でアクセスします。

```go-html-template
{{ $url.Scheme }} → "http"
{{ $url.Host }} → "www.gohugo.io"
```
