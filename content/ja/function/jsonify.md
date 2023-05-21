---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定されたオブジェクトを JSON にエンコードします。
draft: false
hugoversion: null
keywords:
- strings
- json
lastmod: "2020-04-13"
linktitle: jsonify
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- plainify
signature:
- jsonify INPUT
- jsonify OPTIONS INPUT
title: jsonify
workson: []
---

Jsonify は、指定されたオブジェクトを JSON にエンコードします。

JSON の出力をカスタマイズするには、第 1 引数にオプションの辞書を渡します。サポートされているオプションは、"prefix" と "indent" です。 
出力される各 JSON 要素は、*prefix* で始まる新しい行で始まり、インデントのネストに従って *indent* が 1 つ以上続きます。


```go-html-template
{{ dict "title" .Title "content" .Plain | jsonify }}
{{ dict "title" .Title "content" .Plain | jsonify (dict "indent" "  ") }}
{{ dict "title" .Title "content" .Plain | jsonify (dict "prefix" " " "indent" "  ") }}
```

## Jsonify のオプション {#jsonify-options}

indent ("")
: 使用するインデントです。

prefix ("")
: インデント プレフィックスです。

noHTMLEscape (false)
: JSON の引用文字列内の問題のある HTML 文字のエスケープを無効にします。デフォルトの動作は、JSON を HTML に埋め込む際に発生する特定の安全性の問題を回避するために、&、<、> を \u0026、\u003c、および \u003e にエスケープすることです。

また、 `.PlainWords`、`.Plain`、`.RawContent` の [ページ変数][pagevars] も参照してください。

[pagevars]: /variables/page/
