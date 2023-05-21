---
categories:
- functions
date: "2018-11-28"
deprecated: false
description: 最後のスラッシュの直後にパスを分割します。
draft: false
hugoversion: "0.39"
keywords:
- path
- split
lastmod: "2018-11-28"
menu:
  docs:
    parent: functions
publishdate: "2018-11-28"
relatedfuncs:
- path.Base
- path.BaseName
- path.Clean
- path.Dir
- path.Ext
- path.Join
signature:
- path.Split PATH
title: path.Split
workson: []
---

`path.Split` は、最後のスラッシュの直後にある `PATH` を分割し、ディレクトリとベース コンポーネントに分割します。

返される値は、`PATH` = `DIR`+`BASE` というプロパティを持ちます。
`PATH` にスラッシュがない場合、空のディレクトリが返され、ベースは `PATH` に設定されます。

**注意:** Windows では、`PATH` はスラッシュ (`/`) セパレーターに変換されます。

```go-html-template
{{ $dirFile := path.Split "a/news.html" }} → $dirFile.Dir → "a/", $dirFile.File → "news.html"
{{ $dirFile := path.Split "news.html" }} → $dirFile.Dir → "", $dirFile.File → "news.html"
{{ $dirFile := path.Split "a/b/c" }} → $dirFile.Dir → "a/b/", $dirFile.File →  "c"
```
