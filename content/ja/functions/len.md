---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 変数の型に応じた長さを返します。
draft: false
hugoversion: null
keywords: []
lastmod: "2017-04-18"
linktitle: len
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- len INPUT
title: len
toc: false
workson:
- lists
- taxonomies
- terms
---

`len` は Go の組み込み関数で、変数の型に応じた長さを返します。 Go のドキュメントから引用します。

> 配列: v の要素数。
>
> 配列へのポインタ: *v の要素数 (v が nil の場合も含む)。
>
> スライス、またはマップ: v の要素数。v が nil の場合、 len(v) は 0 です。
>
> 文字列: v のバイト数。
>
> チャネル: チャネル バッファにキューに入れられた (未読の) 要素数。v が nil の場合，len(v) は 0 です。

`len` も [Hugo テンプレートの基本的な関数][fundamental function for Hugo templating] と見なされます。

## `len` の例 1: 長い見出し {#len-example-1-longer-headings}

見出しに含まれる文字列の長さに応じてクラスを追加したい場合があります。 以下のテンプレートは、タイトルの長さが80文字以上かどうかをチェックし、80 文字以上であれば `<h1>` に `long-title` クラスを追加します。

{{< code file="check-title-length.html" >}}
<header>
    <h1{{if gt (len .Title) 80}} class="long-title"{{end}}>{{.Title}}</h1>
</header>
{{< /code >}}

## `len` の例 2: `where` を使ってページ数を数える

以下のテンプレートでは、[`where`][] と`len` を組み合わせて使用して、`posts` [セクション][section] 内のコンテンツページの総数を計算します。

{{< code file="how-many-posts.html" >}}
{{ $posts := (where .Site.RegularPages "Section" "==" "posts") }}
{{ $postCount := len $posts }}
{{< /code >}}

`.RegularPages` の使用方法に注意してください。これは [サイト変数][site variable] で、通常のコンテンツページをすべて数えますが、[リストテンプレート][list templates] にフロントマターとコンテンツを追加するために使用する `_index.md` ページは数えません。


[fundamental function for Hugo templating]: /templates/introduction/
[list templates]: /templates/lists/
[section]: /content-management/sections/
[site variable]: /variables/site/
[`where`]: /functions/where/
