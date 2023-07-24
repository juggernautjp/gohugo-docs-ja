---
categories:
- function
date: "2017-02-01"
description: 文字列内の単語数をカウントします。
draft: false
keywords:
- counting
- word count
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs:
- countrunes
signature:
- countwords INPUT
title: countwords
---

テンプレート機能は、[.WordCount ページ変数][pagevars] と似たような働きをします。

```go-html-template
{{ "Hugo is a static site generator." | countwords }}
<!-- outputs a content length of 6 words.  -->
```


[pagevars]: /variables/page/
