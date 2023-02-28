---
aliases: []
categories:
- functions
date: "2018-11-01"
deprecated: false
description: テンプレート ファイルが `layouts` ディレクトリからの相対パスで指定された場所に存在するかどうかをチェックします。
draft: false
hugoversion: "0.46"
keywords:
- templates
- template
- layouts
lastmod: "2018-11-01"
linktitle: ""
menu:
  docs:
    parent: functions
ns: ""
publishdate: "2018-11-01"
relatedfuncs: []
signature:
- templates.Exists PATH
tags: []
title: templates.Exists
toc: false
workson: []
---

テンプレート ファイルは、プロジェクト、または部分テンプレートやショートコードを含むテーマ コンポーネントのいずれかの、 `layouts` ディレクトリの下にあるファイルです。

この関数は、特に動的パスで便利です。 以下の例では、 `.Type` に専用の `header` 部分テンプレートがない場合に、ビルドが中断しないようにします。

```go-html-template
{{ $partialPath := printf "headers/%s.html" .Type }}
{{ if templates.Exists ( printf "partials/%s" $partialPath ) }}
  {{ partial $partialPath . }}
{{ else }}
  {{ partial "headers/default.html" . }}
{{ end }}

```
