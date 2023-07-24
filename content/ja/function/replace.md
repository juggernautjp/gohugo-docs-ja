---
categories:
- function
date: "2017-02-01"
description: 検索文字列のすべての出現箇所を置換文字列に置き換えます。
draft: false
keywords: []
lastmod: "2020-09-07"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: [replaceRE]
signature:
- "replace INPUT OLD NEW [LIMIT]"
- "strings.Replace INPUT OLD NEW [LIMIT]"
title: replace
---

Replace は `INPUT` のコピーで、`OLD` に現れるすべての文字を `NEW` に置き換えたものを返します。
オプションの `LIMIT` パラメータで置換の回数を制限できます。

```go-html-template
`{{ replace "Batman and Robin" "Robin" "Catwoman" }}`
→ "Batman and Catwoman"

{{ replace "aabbaabb" "a" "z" 2 }} → "zzbbaabb"
```
