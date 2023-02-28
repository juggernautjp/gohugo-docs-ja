---
aliases: []
categories:
- variables and params
date: "2017-03-12"
description: ショートコードはページ変数にアクセスでき、独自の組み込み変数も持っています。
draft: false
keywords:
- shortcodes
linktitle: ショートコード変数
menu:
  docs:
    parent: variables
    weight: 20
publishdate: "2017-03-12"
sections_weight: 20
title: ショートコード変数
toc: false
weight: 20
---

[ショートコード][shortcodes] は、[`.Get`][getfunction]、ページレベルおよびサイトレベルの変数、および以下のショートコード固有のフィールドを介して、ショートコード宣言で区切られたパラメータにアクセスできます。

.Name
: ショートコード名です。

.Ordinal
: 親との関係におけるゼロベース (ゼロから始まる) の序数です。親がページ自体である場合、この序数はページコンテンツにおけるこのショートコードの位置を表します。

.Page
: 所有する `Page` です。

.Parent
: ネストされたショートコードの親ショートコード コンテキストへのアクセスを提供します。 これは、ルートから共通のショートコード パラメータを継承するために非常に便利です。

.Position
: ページ内のショートコードの [ファイル名と位置](https://godoc.org/github.com/gohugoio/hugo/common/text#Position) が含まれます。 これは計算に比較的コストがかかる可能性があり、エラー報告用であることに注意してください。 [「ショートコードでのエラー処理」](/templates/shortcode-templates/#error-handling-in-shortcodes) を参照してください。

.IsNamedParams
: 問題のショートコードが [位置指定パラメータではなく名前付きパラメータ][shortcodes] を使用する場合に `true` を返すブール値です。

.Inner
: [終了ショートコード][markdownshortcode] が使用されている場合、開始ショートコード タグと終了ショートコード タグの間のコンテンツを表します。

[getfunction]: /functions/get/
[markdownshortcode]: /content-management/shortcodes/#shortcodes-with-markdown
[shortcodes]: /templates/shortcode-templates/

.InnerDeindent {{< new-in "0.100.0" >}}
: インデントが削除された `.Inner` を取得します。これは、組み込みの `{{</* highlight */>}}` ショートコードで使用されているものです。
