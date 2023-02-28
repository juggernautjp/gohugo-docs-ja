---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: ショートコード宣言の位置指定パラメータと名前付きパラメータにアクセスします。
draft: false
hugoversion: null
keywords:
- shortcodes
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
needsexample: true
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- ".Get INDEX"
- ".Get KEY"
title: .Get
workson: []
---

`.Get` は、独自の [ショートコード テンプレート][sc] を作成するときに、渡された [位置指定および名前付き](/templates/shortcode-templates/#positional-vs-named-parameters) パラメータにアクセスするために特に使用されます。 数値の INDEX と一緒に使用すると、位置パラメータ (0 から始まる) を問い合わせます。文字列の KEY と一緒に使うと、名前付きのパラメータを問い合わせます。

存在しない名前付きパラメータにアクセスすると、`.Get` はビルドを中断する代わりに空文字列を返します。Hugo バージョン 0.40 以降では、位置指定パラメータについても同じことが言えます。これにより、 `.Get` を `if`、`with`、`default`、`cond` と連鎖させて、パラメータが存在するかどうかを確認できるようになります。 たとえば、以下のように使用できます。

```go-html-template
{{ $quality := default "100" (.Get 1) }}
```

[sc]: /templates/shortcode-templates/
