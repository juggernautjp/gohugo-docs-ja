---
categories:
- function
comments: null
date: "2018-03-16"
description: 他の言語から不足している翻訳をマージします。
draft: false
keywords:
- multilingual
menu:
  docs:
    parent: function
relatedfuncs: []
signature:
- lang.Merge FROM TO
title: lang.Merge
---

一例として、

```go-html-template
{{ $pages := .Site.RegularPages | lang.Merge $frSite.RegularPages | lang.Merge $enSite.RegularPages }}
```

上記のコードは、現在のサイトの「ギャップを埋める」ために、左から右に、フランス語のサイトのコンテンツ、最後に英語のコンテンツを使用します。


以下のように、より実用的な例は、他の言語から不足している翻訳を埋めることです。

```go-html-template
{{ $pages := .Site.RegularPages }}
{{ range .Site.Home.Translations }}
{{ $pages = $pages | lang.Merge .Site.RegularPages }}
{{ end }}
```
