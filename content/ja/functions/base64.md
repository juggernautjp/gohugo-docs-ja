---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: '`base64Encode` と `base64Decode` を使うと、パイプを通して簡単にコンテンツを base64 エンコーディングでデコードしたり、その逆を実行したりできます。'
draft: false
hugoversion: null
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- base64Decode INPUT
- base64Encode INPUT
title: base64
workson: []
---

例:

{{< code file="base64-input.html" >}}
<p>Hello world = {{ "Hello world" | base64Encode }}</p>
<p>SGVsbG8gd29ybGQ = {{ "SGVsbG8gd29ybGQ=" | base64Decode }}</p>
{{< /code >}}

{{< output file="base-64-output.html" >}}
<p>Hello world = SGVsbG8gd29ybGQ=</p>
<p>SGVsbG8gd29ybGQ = Hello world</p>
{{< /output >}}

また、他のデータ型を引数として変換しようとするテンプレート関数に渡すこともできます。 `base64Encode` と `base64Decode` の両方が常に文字列を返すので、以下は *42* を整数から文字列に変換します。

```go-html-template
{{ 42 | base64Encode | base64Decode }}
=> "42" rather than 42
```

## API を使用する `base64` {#base64-with-apis}

API からのレスポンスを処理する場合、base64 を使ったデコードとエンコードが威力を発揮します。

```go-html-template
{{ $resp := getJSON "https://api.github.com/repos/gohugoio/hugo/readme"  }}
{{ $resp.content | base64Decode | markdownify }}
```

GitHub API のレスポンスには、Hugo リポジトリの [README.md](https://github.com/gohugoio/hugo/blob/master/README.md) を base64 でエンコードしたバージョンが含まれています。これで、それをデコードして Markdown を解析できます。 最終的な出力は、GitHub 上のレンダリングされたバージョンと同じようなものになります。
