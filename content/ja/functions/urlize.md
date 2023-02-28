---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 文字列を受け取り、URL で使用するためにサニタイズし、スペースをハイフンに変換します。
draft: false
hugoversion: null
keywords:
- urls
- strings
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- urlize INPUT
title: urlize
workson: []
---

以下の例は、以下のフロントマターを持つコンテンツファイルから取り出したものです。

{{< code file="content/blog/greatest-city.md" copy="false">}}
+++
title = "The World's Greatest City"
location = "Chicago IL"
tags = ["pizza","beer","hot dogs"]
+++
{{< /code >}}

以下は、[シングルページ テンプレート][singletemplate] 内の部分テンプレートとして使用される可能性があります。

{{< code file="layouts/partials/content-header.html" download="content-header.html" >}}
<header>
    <h1>{{.Title}}</h1>
    {{ with .Params.location }}
        <div><a href="/locations/{{ . | urlize}}">{{.}}</a></div>
    {{ end }}
    <!-- コンテンツのタグのリストと各ページへのリンクを作成します -->
    {{ with .Params.tags }}
    <ul>
        {{range .}}
            <li>
                <a href="/tags/{{ . | urlize }}">{{ . }}</a>
            </li>
        {{end}}
    </ul>
    {{ end }}
</header>
{{< /code >}}

ページが Hugo のデフォルトのプリティ URL でビルドされていると仮定すると、前述の部分テンプレートは以下のようにレンダリングしたページを出力します。

{{< output file="/blog/greatest-city/index.html" >}}
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
{{< /output >}}

[singletemplate]: /templates/single-page-templates/
