---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 呼び出しごとに再レンダリングする必要のない部分テンプレートのキャッシュを可能にします。
draft: false
hugoversion: null
keywords:
- performance
lastmod: "2017-02-01"
linktitle: partialCached
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- partialCached LAYOUT INPUT [VARIANT...]
title: partialCached
workson: []
---

`partialCached` テンプレート関数は、呼び出しのたびに再レンダリングする必要のない複雑なテンプレートのパフォーマンスを大幅に向上させることができます。

**注意:** 各サイト (または言語) は独自の `partialCached` キャッシュがあるので、各サイトは一度だけパーシャルを実行することになります。

最も簡単な使い方は、以下のとおりです。

```go-html-template
{{ partialCached "footer.html" . }}
```

追加のパラメータを `partialCached` に渡して、キャッシュされたパーシャルの *バリアント* を作成することもできます。 たとえば、同じセクション内のページに対してレンダリングされたときに同一である必要がある複雑なパーシャルがある場合、セクションに基づくバリアントを使用して、パーシャルがセクションごとに 1 回だけレンダリングされるようにすることができます。

{{< code file="partial-cached-example.html" >}}
{{ partialCached "footer.html" . .Section }}
{{< /code >}}

一意のバリアントを作成するために追加のパラメータを渡す必要がある場合は、必要な数のバリアント パラメータを渡すことができます。

```go-html-template
{{ partialCached "footer.html" . .Params.country .Params.province }}
```

バリアント パラメータは基本的な部分テンプレートでは利用できないことに注意してください。 これらは、一意なキャッシュキーを作成するためだけに使われます。 Hugo `0.61.0` 以降では、文字列だけでなく、任意のオブジェクトをキャッシュキーとして使用できます。


> ["The Full Partial Series Part 1: Caching!"](https://regisphilibert.com/blog/2019/12/hugo-partial-series-part-1-caching-with-partialcached/) も参照してください。
