---
categories:
- function
date: "2017-02-01"
description: 指定された文字列内のすべての文字をタイトルケースに変換します。
draft: false
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "title INPUT"
- "strings.Title INPUT"
title: title
---

```go-html-template
{{ title "table of contents (TOC)" }} → "Table of Contents (TOC)"
```

デフォルトでは、Hugoは [AP（Associated Press）スタイルブック][Associated Press (AP) Stylebook] の大文字と小文字のルールに従います。
[Chicago Manual of Style] に従いたい場合、またはすべての単語を大文字にする Go の慣習を使用したい場合は、[サイト設定][site configuration] を変更してください。

[Associated Press (AP) Stylebook]: https://www.apstylebook.com/
[Chicago Manual of Style]: https://www.chicagomanualofstyle.org/home.html
[site configuration]: /getting-started/configuration/#configure-title-case
