---
categories:
- function
date: "2017-02-01"
description: コンテンツのレンダリング時に、適用するビューを取得します。
draft: false
keywords:
- views
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- .Render LAYOUT
title: .Render
---

ビューは代替レイアウトであり、[コンテンツビュー](/templates/views) のドキュメントで指定された場所のいずれかにあるテンプレートを指すファイル名にする必要があります。

この関数は、[リスト コンテキスト][list context] 内の単一のコンテンツに適用された場合にのみ使用できます。

以下の例では、`/layouts/_default/summary.html` にあるコンテンツビューを使用して、コンテンツの一部をレンダリングできます。

```go-html-template
{{ range .Pages }}
  {{ .Render "summary" }}
{{ end }}
```

[list context]: /templates/lists/
