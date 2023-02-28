---
categories:
- asset management
date: "2020-04-09"
description: ビルド後にリソース変換を遅らせることができます。
draft: false
keywords: []
linkTitle: 後処理
menu:
  docs:
    parent: pipes
    weight: 39
sections_weight: 39
title: 後処理 (PostProcess)
weight: 39
---

リソースに `resources.PostProcess` というマークを付けると、変換をビルド後に遅らせます。これは、通常、変換チェーンのステップの 1つ以上がビルドの結果 (たとえば、`public` にあるファイルなど) に依存するためです。 {{< new-in "0.69.0" >}}

その代表的な使用例が、[「PostCSS による CSS パージ」](#css-purging-with-postcss) です。

現在、これには以下の 2つの制約があります。

1. これは `*.html` テンプレート (すなわち、HTML ファイルを生成するテンプレート) でのみ動作します。
2. リソースのメソッドから返された値を操作することはできません。 たとえば、以下の例の `upper` は期待どおりに動作しません。

    ```go-html-template
    {{ $css := resources.Get "css/main.css" }}
    {{ $css = $css | resources.PostCSS | minify | fingerprint | resources.PostProcess }}
    {{ $css.RelPermalink | upper }}
    ```

## PostCSS による CSS パージ {#css-purging-with-postcss}

{{% note %}}
Hugo が PostCSS を使用して CSS のパージを設定するには、いくつかの方法があります。シンプルなプロジェクトであれば、よりシンプルな方法で `resources.PostProcess` を使用せず、テンプレートからキーワードを抽出するだけにすることを検討すべきです。 いくつかの例については、[Tailwind のドキュメント](https://tailwindcss.com/docs/controlling-file-size/#app) を参照してください。
{{% /note %}}

以下の設定は、ビルドの一部としてプロジェクトルートに `hugo_stats.json` ファイルを書き込みます。 これを本番環境でのビルドにのみ使用するのであれば、[config/production](/getting-started/configuration/#configuration-directory) の下に置くことを検討すべきです。

{{< code-toggle file="config" >}}
[build]
  writeStats = true
{{< /code-toggle >}}

`postcss.config.js`

```js
const purgecss = require('@fullhuman/postcss-purgecss')({
    content: [ './hugo_stats.json' ],
    defaultExtractor: (content) => {
        let els = JSON.parse(content).htmlElements;
        return els.tags.concat(els.classes, els.ids);
    }
});

module.exports = {
     plugins: [
         ...(process.env.HUGO_ENVIRONMENT === 'production' ? [ purgecss ] : [])
     ]
 };
```

上記の例では、「CSS パージステップ」は本番ビルドにのみ適用されることに注意してください。つまり、CSS をビルドしてインクルードするには、head テンプレートで以下のような処理を行う必要があります。

```go-html-template
{{ $css := resources.Get "css/main.css" }}
{{ $css = $css | resources.PostCSS }}
{{ if hugo.IsProduction }}
{{ $css = $css | minify | fingerprint | resources.PostProcess }}
{{ end }}
<link href="{{ $css.RelPermalink }}" rel="stylesheet" />
```
