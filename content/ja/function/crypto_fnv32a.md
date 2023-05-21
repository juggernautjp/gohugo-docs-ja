---
title: crypto.FNV32a
description: 指定された文字列の FNV (Fowler-Noll-Vo) 32 ビット ハッシュを返します。
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [crypto hash FNV32 Fowler-Noll-Vo]
signature: ["crypto.FNV32a STRING"]
aliases: []
---

この関数は、[仕様](https://datatracker.ietf.org/doc/html/draft-eastlake-fnv-12) に従って、指定された文字列の 32 ビット [FNV1a ハッシュ](https://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function#FNV-1a_hash) を計算します。

```go-html-template
{{ crypto.FNV32a "Hello world" }} → 1498229191
```
