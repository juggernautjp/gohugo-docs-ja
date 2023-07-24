---
aliases: []
categories:
- function
date: "2017-09-25"
description: Parse は、与えられた URL (相対または絶対) を解析し、URL 構造にします。
draft: false
keywords:
- urls
lastmod: "2017-09-25"
menu:
  docs:
    parent: function
publishdate: "2017-09-25"
signature:
- urls.Parse URL
title: urls.Parse
---

`urls.Parse` 関数は、 URL を [URL 構造体](https://godoc.org/net/url#URL) にパースします。
URL は、相対パス (ホストを含まないパス) か絶対パス ([scheme] で始まるパス) です。
Hugo は、無効な URL をパースするとエラーをスローします。

[scheme]: https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml#uri-schemes-1


```go-html-template
{{ $url := "https://example.org:123/foo?a=6&b=7#bar" }}
{{ $u := urls.Parse $url }}

{{ $u.IsAbs }} → true
{{ $u.Scheme }} → https
{{ $u.Host }} → example.org:123
{{ $u.Hostname }} → example.org
{{ $u.RequestURI }} → /foo?a=6&b=7
{{ $u.Path }} → /foo
{{ $u.Query }} → map[a:[6] b:[7]]
{{ $u.Query.a }} → [6]
{{ $u.Query.Get "a" }} → 6
{{ $u.Query.Has "b" }} → true
{{ $u.Fragment }} → bar
```
