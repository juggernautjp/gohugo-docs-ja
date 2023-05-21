---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列を、既知の安全な JavaScript 文字列として宣言します。
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
- safeJS INPUT
title: safeJS
workson: []
---

ここでいう *安全* とは、文字列が既知の安全な EcmaScript5 式 (例えば `(x + y * z())`) をカプセル化していることを意味します。

テンプレート作成者は、型付けされた式が意図した優先順位を破らないようにし、意味が大きく異なる有効な式でありかつ有効なプログラムでもある `{ foo:bar() }\n['foo']()` のような式を渡すときのように、文と式があいまいにならないようにする責任があります。

例: `.md` ファイルの先頭に `hash = "619c16f"` が定義されている場合は、以下のようになります。

* <span class="good">`<script>var form_{{ .Params.hash | safeJS }};…</script>` &rarr; `<script>var form_619c16f;…</script>`</span>
* <span class="bad">`<script>var form_{{ .Params.hash }};…</script>` &rarr; `<script>var form_"619c16f";…</script>`</span>
