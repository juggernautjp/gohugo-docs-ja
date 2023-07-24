---
categories:
- function
date: "2017-02-01"
description: 最初の値が設定されていない場合に返されるデフォルト値を設定できます。
draft: false
keywords:
- defaults
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
qref: チェックしたときに値が設定されていない場合は、デフォルト値を返します。
relatedfuncs: []
signature:
- default DEFAULT INPUT
title: default
toc: null
---

`default` は、指定された値が設定されているかどうかをチェックし、設定されていない場合はデフォルト値を返します。 このコンテキストでの *Set* は、データ型に応じて異なる意味を持ちます。

* 数値型と時刻の場合は、非ゼロ
* 文字列、配列、スライス、マップの長さが 0 でないこと
* 任意のブール型または構造体型の値
* その他の型の場合は、非ゼロ

`default` 関数の例は、以下のコンテンツページを参照しています。

{{< code file="content/posts/default-function-example.md" >}}
---
title: Sane Defaults
seo_title:
date: 2017-02-18
font:
oldparam: The default function helps make your templating DRYer.
newparam:
---
{{< /code >}}

`default` は、以下のように、複数の方法で記述できます。

```go-html-template
{{ index .Params "font" | default "Roboto" }}
{{ default "Roboto" (index .Params "font") }}
```

上記の `default` 関数の呼び出しは両方とも `Roboto` を返します。

ただし、`default` 値は前の例のようにハードコードする必要はありません。`default` 値は変数にすることもできますし、ドット記法を使ってフロントマターから直接取得することもできます。

```go-html-template
{{$old := .Params.oldparam }}
<p>{{ .Params.newparam | default $old }}</p>
```

上記のコードは、以下を返します。

```html
<p>The default function helps make your templating DRYer.</p>
```

そして、ドット表記を使用した場合は、以下のようになり、

```go-html-template
<title>{{ .Params.seo_title | default .Title }}</title>
```

上記のコードは、以下を返します。

```html
<title>Sane Defaults</title>
```

以下は同等の戻り値を持っていますが、はるかに簡潔ではありません。 これは `default` の有用性を示しています。

`if` を使用した場合:

```go-html-template
<title>{{ if .Params.seo_title }}{{ .Params.seo_title }}{{ else }}{{ .Title }}{{ end }}</title>
=> Sane Defaults
```

`with` を使用した場合:

```go-html-template
<title>{{ with .Params.seo_title }}{{ . }}{{ else }}{{ .Title }}{{ end }}</title>
=> Sane Defaults
```
