---
title: urls.JoinPath
description: 指定された要素を URL 文字列に結合し、./ または ../ 要素の結果を取り除きます。 引数リストが空の場合、JoinPath は空の文字列を返します。
categories: [function]
menu:
  docs:
    parent: function
keywords: [urls,path,join]
signature: ["urls.JoinPath ELEMENT..."]
---

```go-html-template
{{ urls.JoinPath }} → ""
{{ urls.JoinPath "" }} → "/"
{{ urls.JoinPath "a" }} → "a"
{{ urls.JoinPath "a" "b" }} → "a/b"
{{ urls.JoinPath "/a" "b" }} → "/a/b"
{{ urls.JoinPath "https://example.org" "b" }} → "https://example.org/b"

{{ urls.JoinPath (slice "a" "b") }} → "a/b"
```

Unlike the [`path.Join`] function, `urls.JoinPath` retains consecutive leading slashes.

[`path.Join`]: /functions/path.join/
