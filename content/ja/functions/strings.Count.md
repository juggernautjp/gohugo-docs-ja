---
aliases: []
categories:
- functions
date: "2020-09-07"
deprecated: false
description: 文字列の中で、重複しない部分文字列の数を返します。
draft: false
hugoversion: null
keywords:
- count
- counting
- character count
lastmod: "2020-09-07"
menu:
  docs:
    parent: functions
publishdate: "2020-09-07"
relatedfuncs: []
signature:
- "strings.Count SUBSTR STRING"
title: strings.Count
workson: []
---

`SUBSTR` が空文字列の場合、この関数は 1 に `STRING` の Unicode コードポイントの数を加えた値を返します。

例 | 結果
:--|:--
`{{ "aaabaab" \| strings.Count "a" }}` | 5
`{{ "aaabaab" \| strings.Count "aa" }}` | 2
`{{ "aaabaab" \| strings.Count "aaa" }}` | 1
`{{ "aaabaab" \| strings.Count "" }}` | 8
