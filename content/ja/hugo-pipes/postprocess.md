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
    parent: hugo-pipes
    weight: 50
title: 後処理 (PostProcess)
weight: 50
---

## 使用方法 {#usage}

リソースに `resources.PostProcess` というマークを付けると、変換をビルド後に遅らせます。これは、通常、変換チェーンのステップの 1つ以上がビルドの結果 (たとえば、`public` にあるファイルなど) に依存するためです。

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

<!-- TODO (jmm) writeStats => build.buildStats -->

{{< code-toggle file="hugo" >}}
[build.buildStats]
  enable = true
{{< /code-toggle >}}

詳細とオプションについては、[「ビルドを設定する」][configure build] ドキュメントを参照してください。

[configure build]: http://localhost:1313/getting-started/configuration/#configure-build

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

## PostCSS で使用できる Hugo 環境変数 {#hugo-environment-variables-available-in-postcss}

これらは Hugo が PostCSS (および Babel) に渡す環境変数であり、これにより `process.env.HUGO_ENVIRONMENT === 'production' ? [autoprefixer] : []` などが実行できるようになります。

PWD
: プロジェクトの作業ディレクトリへの絶対パス。

HUGO_ENVIRONMENT (および、これのエイリアスの HUGO_ENV)
: 値は、たとえば、`hugo -eproduction` で設定します (デフォルトは、`hugo` の場合は `production`、`hugo server` の場合は `development` です)。

HUGO_PUBLISHDIR
: {{< new-in "0.109.0" >}} 公開ディレクトリ (`public` ディレクトリ) への絶対パス。メモリモードで `hugo server` を実行している場合でも、この値は常にディスク上のディレクトリを指すことに注意してください。サーバを実行する際に PostCSS からこのフォルダに書き込む場合は、以下のフラグのいずれかでサーバを実行することができます。

```text
hugo server --renderToDisk
hugo server --renderStaticToDisk
```

また、Hugo は `assets/_jsconfig` 以下にマウントされたすべてのファイルの環境変数を追加します。
デフォルトのマウントは、プロジェクトルートにある、 `(babel|postcss|tailwind)˶.config.js` の正規表現にマッチするファイルで設定されます。

これらは、`HUGO_FILE_:filename:` の形式で名前が付けられた環境変数を取得します。
ここで、`:filename:` はすべて大文字で、ピリオドはアンダースコアに置き換えられます。 
これにより、以下と同様のことが可能になります。

```js
let tailwindConfig = process.env.HUGO_FILE_TAILWIND_CONFIG_JS || './tailwind.config.js';
```
