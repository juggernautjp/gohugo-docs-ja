---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 絶対 URL を返します。
draft: false
hugoversion: null
keywords:
- urls
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- relURL
signature:
- absURL INPUT
title: absURL
workson: []
---

多言語設定では、代わりに [`absLangURL`] 関数を使用してください。 この関数によって返される URL は、以下によって異なります。

- 入力がスラッシュで始まるかどうか
- サイト設定の `baseURL` の値

### 入力がスラッシュで始まらない場合 {#input-does-not-begin-with-a-slash}

入力がスラッシュで始まらない場合は、`baseURL` に関係なく、結果の URL は正しくなります。

`baseURL = https://example.org/` の場合

```go-html-template
{{ absURL "" }}           →   https://example.org/
{{ absURL "articles" }}   →   https://example.org/articles
{{ absURL "style.css" }}  →   https://example.org/style.css
```

`baseURL = https://example.org/docs/` の場合

```go-html-template
{{ absURL "" }}           →   https://example.org/docs/
{{ absURL "articles" }}   →   https://example.org/docs/articles
{{ absURL "style.css" }}  →   https://example.org/docs/style.css
```

### 入力がスラッシュで始まる場合 {#input-begins-with-a-slash}

入力がスラッシュで始まる場合、 `baseURL` にサブディレクトリが含まれると、結果の URL が正しくなくなります。 先頭にスラッシュがある場合、この関数は `baseURL` の protocol+host セクションからの相対的な URL を返します。

`baseURL = https://example.org/` の場合

```go-html-template
{{ absURL "/" }}          →   https://example.org/
{{ absURL "/articles" }}  →   https://example.org/articles
{{ absURL "/style.css" }} →   https://example.org/style.css
```

`baseURL = https://example.org/docs/` の場合

```go-html-template
{{ absURL "/" }}          →   https://example.org/
{{ absURL "/articles" }}  →   https://example.org/articles
{{ absURL "/style.css" }} →   https://example.org/style.css
```

{{< note >}}
最後の 3 つの例は、ほとんどの場合において望ましいものではありません。ベストプラクティスとして、この関数を使うときは、絶対に先頭のスラッシュを含めないでください。
{{< /note >}}

[`absLangURL`]: /functions/abslangurl/
