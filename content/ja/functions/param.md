---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: テンプレートにページやサイトの変数を呼び出します。
draft: false
hugoversion: null
keywords:
- front matter
lastmod: "2017-04-30"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- default
signature:
- .Param KEY
title: .Param
toc: null
workson: []
---

Hugo では、[サイト全体のパラメータ][sitevars] (つまり、 [設定][configuration] の中) と、[個々のページ][pagevars] に対するパラメータを宣言することができます。

一般的な使用例は、サイトに一般的な値を設定し、一部のページ (画像など) に特定の値を設定することです。

これらの値をテンプレートに呼び出すには、 `.Param` メソッドを使用します。以下は、最初に特定のコンテンツの [フロントマター][front matter] にある `image` パラメータを探します。見つからない場合、Hugo はサイトの設定から `image` パラメータを探します。

```go-html-template
$.Param "image"
```

{{% note %}}
`Param` メソッドは、コンテンツのフロントマターの空文字列を "not found" と見なさないことがあります。 Hugo のアーキタイプを使用して、あらかじめ設定されたフロントマター フィールドを空文字列に設定している場合は、 `Param` の代わりに [`default` 関数](/functions/default/) を使用すると良いかもしれません。 これについては、[GitHub の関連する問題](https://github.com/gohugoio/hugo/issues/3366) を参照してください。
{{% /note %}}


[configuration]: /getting-started/configuration/
[front matter]: /content-management/front-matter/
[pagevars]: /variables/page/
[sitevars]: /variables/site/
