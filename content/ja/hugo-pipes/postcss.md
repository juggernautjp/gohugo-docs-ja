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

任意のアセットファイルは、`resources.PostCSS` を使用して処理できます。これは、リソースオブジェクトと以下にリストされているオプションのスライスを引数に取ります。

リソースはプロジェクトやテーマ独自の `postcss.config.js` や `config` オプションで設定された任意のファイルを使用して処理されます。

```go-html-template
{{ $css := resources.Get "css/main.css" }}
{{ $style := $css | resources.PostCSS }}
```

PostCSS 機能を使用するには、必要な Node.js パッケージをインストールする必要があります。 たとえば、`autoprefixer` パッケージを使用するには、プロジェクトのルートから以下のコマンドを実行します。

```bash
npm install postcss postcss-cli autoprefixer
```

### オプション {#options}

config [string]
: 設定ファイルを探すためのカスタムディレクトリを設定します

noMap [bool]
: デフォルトは `false` です。デフォルトのインライン ソースマップを無効にします

inlineImports [bool]
: デフォルトは `false` です。 @import 文のインライン化を有効にします。これは再帰的に実行されますが、ファイルのインポートは一度だけです。
URL インポート (たとえば、`@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');`) とメディアクエリを含むインポートは無視されます。
このインポート ルーチンは CSS 仕様を考慮しないことに注意してください。そのため、ファイル内のどこにでも @import を含めることができます。
Hugo はモジュールのマウントから相対的にインポートを探し、テーマのオーバーライドを尊重します。

skipInlineImportsNotFound [bool] {{< new-in "0.99.0" >}}
: デフォルトは `false` です。 Hugo 0.99.0 以前では、`inlineImports` が有効で、インポートの解決に失敗すると、警告としてログに記録していました。現在はビルドに失敗するようになりました。 CSS に通常の CSS インポートがあり、それを保持したい場合は、URL やメディアクエリでインポートを使用するか (Hugo はそれらを解決しようとしません)、`skipInlineImportsNotFound` を true に設定します。

_設定ファイルを使用しない場合_ は、以下のように指定します。

use [string]
: 使用する PostCSS プラグインをスペースで区切ったリスト

parser [string]
: カスタム PostCSS パーサー

stringifier [string]
: カスタム PostCSS 文字列化子 (stringifier)

syntax [string]
: カスタム PostCSS 構文

```go-html-template
{{ $options := dict "config" "/path/to/custom-config-directory" "noMap" true }}
{{ $style := resources.Get "css/main.css" | resources.PostCSS $options }}

{{ $options := dict "use" "autoprefixer postcss-color-alpha" }}
{{ $style := resources.Get "css/main.css" | resources.PostCSS $options }}
```

## postcss.config.js から Hugo の環境を確認する {#check-hugo-environment-from-postcssconfigjs}

現在の Hugo 環境名 (`--environment` や config や OS 環境で設定されたもの) は Node コンテキストで利用可能であり、以下のような構成をとることができます。

```js
module.exports = {
  plugins: [
    require('autoprefixer'),
    ...process.env.HUGO_ENVIRONMENT === 'production'
      ? [purgecss]
      : []
  ]
}
```
