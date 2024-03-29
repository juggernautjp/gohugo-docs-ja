---
aliases: []
categories:
- function
date: "2017-02-01"
description: 言語プレフィックスがある場合、それを付けた相対 URL を返します。
draft: false
keywords:
- multilingual
- i18n
- urls
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "relLangURL INPUT"
title: relLangURL
---

この機能は、単一言語構成と多言語構成の両方で使用してください。 この関数によって返される URL は、以下によって異なります。

- 入力がスラッシュで始まるかどうか
- サイト設定の `baseURL` の値
- 言語プレフィックスがある場合は、その内容

以下の例では、プロジェクトは多言語であり、内容はスペイン語 (`es`) と英語 (`en`) の両方です。 デフォルトの言語はスペイン語です。 戻り値は英語サイトのものです。

### 入力がスラッシュで始まらない場合 {#input-does-not-begin-with-a-slash}

入力がスラッシュで始まらない場合は、`baseURL` に関係なく、結果の URL は正しくなります。

`baseURL = https://example.org/` の場合

```go-html-template
{{ relLangURL "" }}           →   /en/
{{ relLangURL "articles" }}   →   /en/articles
{{ relLangURL "style.css" }}  →   /en/style.css
``` 

`baseURL = https://example.org/docs/` の場合

```go-html-template
{{ relLangURL "" }}           →   /docs/en/
{{ relLangURL "articles" }}   →   /docs/en/articles
{{ relLangURL "style.css" }}  →   /docs/en/style.css
```

### 入力がスラッシュで始まる場合 {#input-begins-with-a-slash}

入力がスラッシュで始まる場合、 `baseURL` にサブディレクトリが含まれると、結果の URL が正しくなくなります。 先頭にスラッシュがある場合、この関数は `baseURL` の protocol+host セクションからの相対的な URL を返します。

`baseURL = https://example.org/` の場合

```go-html-template
{{ relLangURL "/" }}          →   /en/
{{ relLangURL "/articles" }}  →   /en/articles
{{ relLangURL "/style.css" }} →   /en/style.css
``` 

`baseURL = https://example.org/docs/` の場合

```go-html-template
{{ relLangURL "/" }}          →   /en/
{{ relLangURL "/articles" }}  →   /en/articles
{{ relLangURL "/style.css" }} →   /en/style.css
```

{{< note >}}
最後の 3 つの例は、ほとんどの場合において望ましいものではありません。ベストプラクティスとして、この関数を使うときは、絶対に先頭のスラッシュを含めないでください。
{{< /note >}}
