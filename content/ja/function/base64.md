---
aliases: []
categories:
- function
date: "2017-02-01"
description: '`base64Encode` と `base64Decode` を使うと、パイプを通して簡単にコンテンツを base64 エンコーディングでデコードしたり、その逆を実行したりできます。'
draft: false
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- base64Decode INPUT
- base64Encode INPUT
title: base64
---

```go-html-template
{{ "Hugo" | base64Encode }} → "SHVnbw=="
{{ "SHVnbw==" | base64Decode }} → "Hugo"
```

## API を使用する `base64` {#base64-with-apis}

API からのレスポンスを処理する場合、base64 を使ったデコードとエンコードが威力を発揮します。

```go-html-template
{{ $resp := getJSON "https://api.github.com/repos/gohugoio/hugo/readme"  }}
{{ $resp.content | base64Decode | markdownify }}
```

GitHub API のレスポンスには、Hugo リポジトリの [README.md](https://github.com/gohugoio/hugo/blob/master/README.md) を base64 でエンコードしたバージョンが含まれています。 これで、それをデコードして Markdown を解析できます。 最終的な出力は、GitHub 上のレンダリングされたバージョンと同じようなものになります。
