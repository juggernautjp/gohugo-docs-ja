---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプは、PostCSS を使用して CSS ファイルを処理できます。
draft: false
keywords: []
menu:
  docs:
    parent: pipes
    weight: 40
publishdate: "2018-07-14"
sections_weight: 40
title: PostCSS
weight: 40
---

## セットアップ {#setup}

[利用可能な PostCSS プラグイン](https://www.postcss.parts/) のいずれかを使用して CSS を変換するには、以下の手順に従ってください。

ステップ 1
: [Node.js](https://nodejs.org/ja/download) をインストールします。

ステップ 2
: 必要な Node.js パッケージをプロジェクトのルートにインストールします。 たとえば、CSS ルールにベンダー プレフィックスを追加するには、以下のようにします。

```bash
npm install postcss postcss-cli autoprefixer
```

ステップ 3
: プロジェクトのルートに PostCSS 設定ファイルを作成します。 このファイルの名前は、`postcss.config.js` またはその他の [サポートされているファイル名] のいずれかにする必要があります。たとえば、以下のようにします。

[supported file names]: https://github.com/postcss/postcss-load-config#usage

{{< code file="postcss.config.js" >}}
module.exports = {
  plugins: [
    require('autoprefixer')
  ]
};
{{< /code >}}

{{% note %}}
Windows ユーザーで、プロジェクトのパスにスペースが含まれている場合、package.json ファイル内に PostCSS 設定を配置する必要があります。 [この例](https://github.com/postcss/postcss-load-config#packagejson) と issue [#7333](https://github.com/gohugoio/hugo/issues/7333) を参照してください。
{{% /note %}}

ステップ 4
: CSS ファイルを `assets` ディレクトリに置きます。

ステップ 5
: CSS ファイルをリソースとしてキャプチャし、`resources.PostCSS` (別名 `postCSS`) を通して以下のようにパイプします。

{{< code file="layouts/partials/css.html" >}}
{{ with resources.Get "css/main.css" | postCSS }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
{{< /code >}}

`assets` ディレクトリ内の Sass ファイルから始める場合は、以下のようにします。

{{< code file="layouts/partials/css.html" >}}
{{ with resources.Get "sass/main.scss" | toCSS | postCSS }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
{{< /code >}}

### オプション {#options}

`resources.PostCSS` メソッドは、オプションのオプションのマップを受け取ります。

config
: (`string`) PostCSS 設定ファイルが含まれるディレクトリ。 デフォルトはプロジェクト ディレクトリのルートです。

noMap
: (`bool`) デフォルトは `false` です。 `true`の場合、デフォルトのインライン ソースマップを無効にします

inlineImports
: (`bool`) デフォルトは `false` です。 @import 文のインライン化を有効にします。これは再帰的に実行されますが、ファイルのインポートは一度だけです。
URL インポート (たとえば、`@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');`) とメディアクエリを含むインポートは無視されます。
このインポート ルーチンは CSS 仕様を考慮しないことに注意してください。そのため、ファイル内のどこにでも @import を含めることができます。
Hugo はモジュールのマウントから相対的にインポートを探し、テーマのオーバーライドを尊重します。

skipInlineImportsNotFound {{< new-in "0.99.0" >}}
: (`bool`) デフォルトは `false` です。 Hugo 0.99.0 以前では、`inlineImports` が有効で、インポートの解決に失敗すると、警告としてログに記録していました。現在はビルドに失敗するようになりました。 CSS に通常の CSS インポートがあり、それを保持したい場合は、URL やメディアクエリでインポートを使用するか (Hugo はそれらを解決しようとしません)、`skipInlineImportsNotFound` を true に設定します。

{{< code file="layouts/partials/css.html" >}}
{{ $opts := dict "config" "config-directory" "noMap" true }}
{{ with resources.Get "css/main.css" | postCSS $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
{{< /code >}}

## 設定ファイルがない場合 {#no-configuration-file}

PostCSS 設定ファイルを使用しないようにするには、オプションマップを使用して最小限の設定を指定できます。

use [string]
: 使用する PostCSS プラグインをスペースで区切ったリスト

parser [string]
: カスタム PostCSS パーサー

stringifier [string]
: カスタム PostCSS 文字列化子 (stringifier)

syntax [string]
: カスタム PostCSS 構文

{{< code file="layouts/partials/css.html" >}}
{{ $opts := dict "use" "autoprefixer postcss-color-alpha" }}
{{ with resources.Get "css/main.css" | postCSS $opts }}
  <link rel="stylesheet" href="{{ .RelPermalink }}">
{{ end }}
{{< /code >}}

## Hugo の環境を確認する {#check-hugo-environment}

現在の Hugo 環境名 (`--environment` やコンフィグ設定や OS 環境で設定されたもの) は、 Node コンテキストで利用可能であり、以下のような構成をとることができます。

{{< code file="postcss.config.js" >}}
module.exports = {
  plugins: [
    require('autoprefixer'),
    ...process.env.HUGO_ENVIRONMENT === 'production'
      ? [purgecss]
      : []
  ]
}
{{< /code >}}
