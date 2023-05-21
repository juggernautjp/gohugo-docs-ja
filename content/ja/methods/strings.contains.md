---
title: strings.Contains
description: 文字列が部分文字列を含んでいるかどうかを報告します。
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [string strings substring contains]
signature: 
- "strings.Contains STRING SUBSTRING"
aliases: []
relatedfuncs: [strings.ContainsAny]
---

```go-html-template
{{ strings.Contains "Hugo" "go" }} → true
```

チェックでは、以下のように、大文字と小文字を区別します。

```go-html-template
{{ strings.Contains "Hugo" "Go" }} → false
```
