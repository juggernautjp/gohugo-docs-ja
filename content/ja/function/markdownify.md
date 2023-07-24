---
categories:
- function
date: "2017-02-01"
description: 指定された文字列を Markdown プロセッサーを介して実行します。
draft: false
keywords:
- markdown
- content
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- markdownify INPUT
title: markdownify
---


```go-html-template
{{ .Title | markdownify }}
```

結果の HTML が 1 つの段落である場合、Hugo は、上記の例で必要とされるように、ラップする `p` タグを削除してインライン HTML を生成します。

1 つの段落に対して `p` タグの折り返しを維持するには、[`.Page.RenderString`] メソッドを使用し、`display` オプションを `block` に設定します。

結果の HTML が 2 段落以上の場合、Hugo はラップする `p` タグをそのまま残します。

[`.Page.RenderString`]: /functions/renderstring/

{{% note %}}
`markdownify` 関数は Markdown を HTML にレンダリングする際に、[markdown レンダーフック][markdown render hooks] を尊重しますが、レンダーフックが `.Page` コンテキストにアクセスする場合は、`markdownify` の代わりに `.Page.RenderString` メソッドを使用してください。
なお、詳細は、issue [#9692] を参照してください。

[markdown render hooks]: /templates/render-hooks/
[#9692]: https://github.com/gohugoio/hugo/issues/9692
{{% /note %}}
