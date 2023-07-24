---
categories:
- function
date: "2017-02-01"
description: パラメータが設定されている場合、true を返します。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- isset COLLECTION INDEX
- isset COLLECTION KEY
title: isset
---

スライス、配列、あるいはチャネルとインデックス、あるいはマップとキーを入力とします。

```go-html-template
{{ if isset .Params "project_url" }} {{ index .Params "project_url" }}{{ end }}
```

{{% note %}}
サイトレベルの設定キーはすべて小文字で保存されます。したがって、[サイト設定ファイル](/getting-started/configuration/) 内の `myParam` というキーと値のセットには、`{{if isset .Site.Params "myparam"}}` でアクセスし、 `{{if isset .Site.Params "myParam"}}` ではアクセスできない必要があるのです。
なお、[`with`](/function/with) を使用する場合など、`.Site.Params.myParam` *または* `.Site.Params.myparam` を使用して同じ設定キーにアクセスできることに注意してください。
この制限は、[ショートコード](/content-management/shortcodes/) 内からページレベルのフロントマターのキーにアクセスする場合にも適用されます。
{{% /note %}}
