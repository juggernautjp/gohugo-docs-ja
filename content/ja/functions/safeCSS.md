---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列を、既知の「安全な」 CSS 文字列として宣言します。
draft: false
hugoversion: null
keywords:
- style
- css
- strings
lastmod: "2017-02-26"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- safeHTML
- safeHTMLAttr
signature:
- safeCSS INPUT
title: safeCSS
workson: []
---

ここでいう *安全* とは、以下のいずれかに該当する CSS コンテンツを指します。

1. `p { color: Purple }` のような CSS3 スタイルシートの生成。
2. `a[href=~"https:"].foo#bar` のような CSS3 ルールの生成。
3. `color: red; margin: 2px` のような CSS3 宣言の生成。
4. `rgba(0, 0, 255, 127)` のような CSS3 値の生成。

例: `.md` ファイルのフロントマターで定義された `style = "color: red;"` が与えられたとします。

* <span class="good">`<p style="{{ .Params.style | safeCSS }}">…</p>` &rarr; `<p style="color: red;">…</p>`</span>
* <span class="bad">`<p style="{{ .Params.style }}">…</p>` &rarr; `<p style="ZgotmplZ">…</p>`</span>

{{% note "ZgotmplZ" %}}
"ZgotmplZ" は、安全でないコンテンツが CSS または URL コンテキストに到達したことを示す特別な値です。
{{% /note %}}
