---
categories:
- function
date: "2017-02-01"
description: 文字列を受け取り、URL で使用するためにサニタイズし、スペースをハイフンに変換します。
draft: false
keywords:
- urls
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- urlize INPUT
title: urlize
---

以下の例は、以下のフロントマターを持つコンテンツファイルから取り出したものです。

{{< code-toggle file="content/blog/greatest-city.md" fm=true copy=false >}}
title = "The World's Greatest City"
location = "Chicago IL"
tags = ["pizza","beer","hot dogs"]
{{< /code-toggle >}}

以下は、[シングルページ テンプレート][singletemplate] 内のパーシャルとして使用される可能性があります。

{{< code file="layouts/partials/content-header.html" >}}
<header>
    <h1>{{ .Title }}</h1>
    {{ with .Params.location }}
        <div><a href="/locations/{{ . | urlize }}">{{ . }}</a></div>
    {{ end }}
    <!-- コンテンツのタグのリストと各ページへのリンクを作成する。 -->
    {{ with .Params.tags }}
    <ul>
        {{ range .}}
            <li>
                <a href="/tags/{{ . | urlize }}">{{ . }}</a>
            </li>
        {{ end }}
    </ul>
    {{ end }}
</header>
{{< /code >}}

先のパーシャルは、レンダリングされたページに以下のように出力される。

```html
<header>
  <h1>The World&#39;s Greatest City</h1>
  <div><a href="/locations/chicago-il">Chicago IL</a></div>
  <ul>
    <li>
      <a href="/tags/pizza">pizza</a>
    </li>
    <li>
      <a href="/tags/beer">beer</a>
    </li>
    <li>
      <a href="/tags/hot-dogs">hot dogs</a>
    </li>
  </ul>
</header>
```

[singletemplate]: /templates/single-page-templates/
