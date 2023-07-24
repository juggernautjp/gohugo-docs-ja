---
categories:
- function
date: "2018-11-01"
description: テンプレート ファイルが `layouts` ディレクトリからの相対パスで指定された場所に存在するかどうかをチェックします。
draft: false
keywords:
- templates
- template
- layouts
lastmod: "2018-11-01"
menu:
  docs:
    parent: function
ns: ""
publishdate: "2018-11-01"
relatedfuncs: []
signature:
- templates.Exists PATH
tags: []
title: templates.Exists
toc: false
---

テンプレート ファイルは、プロジェクト、またはパーシャルやショートコードを含むテーマ コンポーネントのいずれかの、 `layouts` ディレクトリの下にあるファイルです。

この関数は、特に動的パスで便利です。 以下の例では、 `.Type` に専用の `header` パーシャルがない場合に、ビルドが中断しないようにします。

```go-html-template
{{ $partialPath := printf "headers/%s.html" .Type }}
{{ if templates.Exists ( printf "partials/%s" $partialPath ) }}
  {{ partial $partialPath . }}
{{ else }}
  {{ partial "headers/default.html" . }}
{{ end }}

```
