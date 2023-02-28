---
title: strings.ContainsAny
description: 文字列指定された文字列の文字が含まれているかどうかを報告します。
categories: [functions]
menu:
  docs:
    parent: "functions"
keywords: [string strings substring contains any]
signature: 
- "strings.ContainsAny STRING CHARACTERS"
aliases: []
relatedfuncs: [strings.Contains]
---

```go-html-template
{{ strings.ContainsAny "Hugo" "gm" }} → true
```

チェックでは、以下のように、大文字と小文字を区別します。

```go-html-template
{{ strings.ContainsAny "Hugo" "Gm" }} → false
```
