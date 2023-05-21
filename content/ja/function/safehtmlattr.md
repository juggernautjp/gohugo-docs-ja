---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列を安全な HTML 属性として宣言します。
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
- "safeHTMLAttr INPUT"
title: safeHTMLAttr
workson: []
---

以下のメニューエントリを含むサイト設定があるとします。

{{< code-toggle file="config" >}}
[[menu.main]]
  name = "IRC"
  url = "irc://irc.freenode.net/#golang"
{{< /code-toggle >}}

以下のように、属性で直接 `url` 値を使用しようとしています。

```go-html-template
{{ range site.Menus.main }}
  <a href="{{ .URL }}">{{ .Name }}</a>
{{ end }}
``` 

上記のコードは、下記コードを出力します。

```html
<a href="#ZgotmplZ">IRC</a>
```

`ZgotmplZ` は Go の [template/html] パッケージによって挿入される特別な値で、安全でないコンテンツが CSS または URL コンテキストに到達したことを示します。

安全性チェックをオーバーライドするには、`safeHTMLAttr` 関数を使用します。

```go-html-template
{{ range site.Menus.main }}
  <a {{ printf "href=%q" .URL | safeHTMLAttr }}>{{ .Name }}</a>
{{ end }}
``` 

[template/html]: https://pkg.go.dev/html/template
