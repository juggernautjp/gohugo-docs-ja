---
categories:
- functions
date: "2018-10-13"
description: 文字列を受け取り、[`defaultMarkdownHandler`](https://gohugo.io/getting-started/configuration-markup#configure-markup) が Markdown ヘッダーに対して行うのと同じ方法でサニタイズします。
draft: false
hugoversion: "0.39"
keywords:
- markdown
- strings
menu:
  docs:
    parent: functions
relatedfuncs:
- humanize
signature:
- anchorize INPUT
title: anchorize
workson: []
---

[Goldmark](https://gohugo.io/getting-started/configuration-markup#goldmark) が `defaultMarkdownHandler` として設定されている場合、サニタイズ ロジックは [`markup.goldmark.parser.autoHeadingIDType`](https://gohugo.io/getting-started/configuration-markup#goldmark) の設定に準拠します。.

`defaultMarkdownHandler`とこのテンプレート関数は同じサニタイズ ロジックを使用しているので、後者を使用して、アンカータグでリンクするためのヘッダー ID を決定ができます。

```go-html-template
{{ anchorize "This is a header" }} --> "this-is-a-header"
{{ anchorize "This is also    a header" }} --> "this-is-also----a-header"
{{ anchorize "main.go" }} --> "maingo"
{{ anchorize "Article 123" }} --> "article-123"
{{ anchorize "<- Let's try this, shall we?" }} --> "--lets-try-this-shall-we"
{{ anchorize "Hello, 世界" }} --> "hello-世界"
```
