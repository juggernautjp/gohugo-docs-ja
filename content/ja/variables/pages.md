---
aliases:
- /pages
categories:
- variables and params
date: "2019-10-20"
description: Pages は、Hugo の中核となるページ コレクションで、多くの便利なメソッドを備えています。
draft: false
keywords:
- pages
linktitle: null
menu:
  docs:
    parent: variables
    title: ページ コレクションで定義されたメソッド
    weight: 21
sections_weight: 20
title: ページメソッド
toc: true
weight: 21
---

ソートメソッドの概要については、[「リストテンプレート」](/templates/lists) も参照してください。

## .Next **ページ** {#next-page}

`Pages` の `.Next` と `.Prev` は、`.Page` の同じ名前のメソッドと同様に機能しますが、任意のページ コレクションで使用できるため、より柔軟です (そして若干遅くなります)。

`.Next` は、引数として送られたページからの相対的な次のページを **上** に指します。たとえば、 `{{with .Site.RegularPages.Next . }}{{.RelPermalink}}{{end}}` になります。 コレクション内の最初のページで `.Next` を呼び出すと、`nil` が返されます。

## .Prev **ページ** {#prev-page}

`.Prev` は、引数として送られたページを基準にして、前のページを **下** に指します。たとえば、 `{{with .Site.RegularPages.Prev . }}{{.RelPermalink}}{{end}}` になります。 コレクション内の最後のページで `.Prev` を呼び出すと、`nil` が返されます。
