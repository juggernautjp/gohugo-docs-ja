---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 文字列内の単語数をカウントします。
draft: false
hugoversion: null
keywords:
- counting
- word count
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- countrunes
signature:
- countwords INPUT
title: countwords
workson: []
---

テンプレート機能は、[.WordCount ページ変数][pagevars] と似たような働きをします。

```go-html-template
{{ "Hugo is a static site generator." | countwords }}
<!-- outputs a content length of 6 words.  -->
```


[pagevars]: /variables/page/
