---
aliases: []
categories:
- functions
date: "2018-11-07"
description: '`collections.Complement` (別名 `complement`) は、他のどのコレクションにもないコレクションの要素を提供します。'
draft: false
hugoversion: "0.51"
keywords:
- collections
- intersect
- union
menu:
  docs:
    parent: functions
signature:
- "complement COLLECTION [COLLECTION]..."
- "collections.Complement COLLECTION [COLLECTION]..."
title: complement
---

`$c1` または `$c2` に存在しない `$c3` 内の要素を見つけるには、以下のように書きます。

```go-html-template
{{ $c1 := slice 3 }}
{{ $c2 := slice 4 5  }}
{{ $c3 := slice 1 2 3 4 5 }}

{{ complement $c1 $c2 $c3 }} → [1 2]
```

{{% note %}}
[チェーン パイプライン][chained pipeline] を使用して、コードを理解しやすくします。

[chained pipeline]: https://pkg.go.dev/text/template#hdr-Pipelines
{{% /note %}}


```go-html-template
{{ $c3 | complement $c1 $c2 }} → [1 2]
```

また、ページコレクションでも `complement` 関数を使用することができます。たとえば、サイトに、以下の 5 つのコンテンツタイプがあるとします。

```text
content/
├── blog/
├── books/
├── faqs/
├── films/
└── songs/
```

ブログ記事 (`blog`) とよくある質問 (`faqs`) 以外のすべてを一覧表示するには、以下のように書きます。

```go-html-template
{{ $blog := where site.RegularPages "Type" "blog" }}
{{ $faqs := where site.RegularPages "Type" "faqs" }}
{{ range site.RegularPages | complement $blog $faqs }}
  <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
{{ end }}
```

{{% note %}}
上記の例では `complement` 関数を使用していますが、以下のように、[`where`] 関数も同様に使用できます。

[`where`]: /functions/where/
{{% /note %}} 

```go-html-template
{{ range where site.RegularPages "Type" "not in" (slice "blog" "faqs") }}
  <a href="{{ .RelPermalink }}">{{ .LinkTitle }}</a>
{{ end }}
```

以下の例では、`complement` 関数を使用して、文から [ストップワード][stop words] を削除します。

```go-html-template
{{ $text := "The quick brown fox jumps over the lazy dog" }}
{{ $stopWords := slice "a" "an" "in" "over" "the" "under" }}
{{ $filtered := split $text " " | complement $stopWords }}

{{ delimit $filtered " " }} → The quick brown fox jumps lazy dog
```

[stop words]: https://en.wikipedia.org/wiki/Stop_word
