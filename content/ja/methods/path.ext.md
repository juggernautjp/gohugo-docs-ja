---
categories:
- functions
date: "2018-11-28"
deprecated: false
description: Ext は、パスのファイル名の拡張子を返します。
draft: false
hugoversion: "0.40"
keywords:
- path
- ext
- extension
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
- path.Join
- path.Split
signature:
- path.Ext PATH
title: path.Ext
workson: []
---

`path.Ext` は、ファイル名の拡張子 `PATH` を返します。

拡張子は、スラッシュで区切られた最後の要素 `PATH` の最後のドットで始まるサフィックスです。
ドットがない場合は空になります。

**注意:** Windows では、`PATH` はスラッシュ (`/`) セパレーターに変換されます。

```go-html-template
{{ path.Ext "a/b/c/news.html" }} → ".html"
```
