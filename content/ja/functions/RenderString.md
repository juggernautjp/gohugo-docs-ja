---
categories:
- functions
date: "2019-12-18"
description: マークアップを HTML にレンダリングします。
draft: false
keywords:
- markdown
- goldmark
- render
menu:
  docs:
    parent: functions
signature:
- ".RenderString MARKUP"
title: .RenderString
---

`.RenderString` は `Page` のメソッドで、(オプションで設定されていない場合) そのページで定義されたコンテンツ レンダラーを使って、マークアップを HTML にレンダリングします。

このメソッドは、以下のオプションを持つオプションのマップ引数を取ります。

display ("inline")
: `inline` または `block` です。 `inline` (デフォルト) の場合、短いスニペットの周囲の `<p></p>` がトリミングされます。

markup (defaults to the Page's markup)
: [「コンテンツフォーマットの一覧」](/content-management/formats/#list-of-content-formats) の識別子を参照してください。

以下に、いくつかの例を挙げます。

```go-html-template
{{ $optBlock := dict "display" "block" }}
{{ $optOrg := dict "markup" "org" }}
{{ "**Bold Markdown**" | $p.RenderString }}
{{  "**Bold Block Markdown**" | $p.RenderString  $optBlock }}
{{  "/italic org mode/" | $p.RenderString  $optOrg }}
```

{{< new-in "0.93.0" >}} **注意**: [markdownify](/functions/markdownify/) は、[レンダーフック](/getting-started/configuration-markup/#markdown-render-hooks) をサポートするためにこの関数を使用します。
