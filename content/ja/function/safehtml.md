---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: Go テンプレートによるエスケープを避けるため、指定された文字列を「安全な」 HTML ドキュメントとして宣言します。
draft: false
hugoversion: null
keywords:
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- safeHTML INPUT
title: safeHTML
workson: []
---

サードパーティの HTML や、タグやコメントが閉じられていない HTML には使用しないでください。

サイト全体の [`config.toml`][config] に以下の `copyright` 値があるとします。

{{< code-toggle file="config" >}}
copyright = "© 2015 Jane Doe.  <a href=\"https://creativecommons.org/licenses/by/4.0/\">Some rights reserved</a>."
{{< /code-toggle >}}

テンプレート内の `{{ .Site.Copyright | safeHTML }}` は、以下のように出力されます。

```html
© 2015 Jane Doe.  <a href="https://creativecommons.org/licenses/by/4.0/">Some rights reserved</a>.
```

ただし、`safeHTML` 関数がないと、html/template は `.Site.Copyright` が安全でないと判断し、すべての HTML タグをエスケープし、文字列全体をプレーン テキストとしてレンダリングします。

```html
<p>© 2015 Jane Doe.  &lt;a href=&#34;https://creativecommons.org/licenses by/4.0/&#34;&gt;Some rights reserved&lt;/a&gt;.</p>
```

[config]: /getting-started/configuration/
