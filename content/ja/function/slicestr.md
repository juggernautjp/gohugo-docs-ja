---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 開始インデックスと終了インデックスを含む、半分開いた範囲のスライスを作成します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "slicestr STRING START [END]"
- "strings.SliceString STRING START [END]"
title: slicestr
workson: []
---

例えば、1 と 4 は、1 から 3 の要素を含むスライスを作成します。
`end` インデックスは省略可能で、デフォルトは文字列の長さです。

* `{{slicestr "BatMan" 3}}` → "Man"
* `{{slicestr "BatMan" 0 3}}` → "Bat"
