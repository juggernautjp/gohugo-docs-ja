---
categories:
- functions
date: "2017-02-01"
deprecated: false
description: スコープ内でコンテキスト (`.`) を再バインドし、変数が存在しないか空の場合はブロックをスキップします。
draft: false
hugoversion: null
keywords:
- conditionals
lastmod: "2017-03-12"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- with INPUT
title: with
workson: []
---

`if` 文を書いた後に同じ値を参照する方法として、代わりに `with` を使用する方法があります。 `with` はそのスコープ内でコンテキスト (`.`) を再バインドし、変数が存在しないか、設定されていないか、または空の場合、ブロックをスキップします。

*空の* 値のセットは、[Go テンプレート パッケージ](https://golang.org/pkg/text/template/) によって定義されます。 空の値には、 `false` 、数字のゼロ、空の文字列が含まれます。

インデックスまたはキーがスライス、配列、チャネル、またはマップに存在する場合にブロックをレンダリングする場合は、値が空であるかどうかに関係なく、代わりに [`isset`](/functions/isset) を使用する必要があります。

以下の例では、`twitteruser` という [ユーザー定義のサイト変数](/variables/site/) をチェックします。 キー/値 が設定されていない場合、以下は何もレンダリングしません。

{{< code file="layouts/partials/twitter.html" >}}
{{with .Site.Params.twitteruser}}<span class="twitter">
<a href="https://twitter.com/{{.}}" rel="author">
<img src="/images/twitter.png" width="48" height="48" title="Twitter: {{.}}"
 alt="Twitter"></a>
</span>{{end}}
{{< /code >}}
