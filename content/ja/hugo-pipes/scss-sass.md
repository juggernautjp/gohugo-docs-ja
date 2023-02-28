---
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプでは、Sass ファイルおよび SCSS ファイルを処理できます。
draft: false
keywords: []
menu:
  docs:
    parent: pipes
    weight: 30
publishdate: "2018-07-14"
sections_weight: 02
title: Sass / SCSS
weight: 02
---

どのような Sass や SCSS ファイルでも、リソースオブジェクトと以下に示すオプションのマップの 2 つの引数を取る `resources.ToCSS` を使って CSS ファイルに変換できます。

```go-html-template
{{ $sass := resources.Get "sass/main.scss" }}
{{ $style := $sass | resources.ToCSS }}
```

### オプション {#options}

transpiler [string]
: 使用する `transpiler` を指定します。有効な値は `libsass` (デフォルト) と `dartsass` です。 Hugo を Dart Sass と一緒に使いたい場合は、[Embedded Dart Sass](https://github.com/sass/dart-sass-embedded/releases) からリリースバイナリをダウンロードして、PC の `$PATH` (Windows では `%PATH%`) に配置する必要があります。[^1]

targetPath [string]
: 設定されていない場合、リソースのターゲットパスはアセットファイルの元のパスであり、その拡張子は `.css` に置き換えられます。

outputStyle [string]
: デフォルトは `nested` (LibSass) と `expanded` (Dart Sass) です。LibSass で利用可能なその他の出力スタイルは、`expanded`、`compact`、`compressed` です。 Dart Sass は、 `expanded` と `compressed` のみをサポートします。

precision [int]
: 浮動小数点演算の精度です。**注意:** このオプションは、Dart Sass ではサポートされていません。

enableSourceMap [bool]
: 有効にすると、ソースマップが生成されます。

sourceMapIncludeSources [bool]
: 有効にすると、生成されたソースマップにソースが埋め込まれます。 (Dart Sass のみ)。 {{< new-in "0.108.0" >}}

includePaths [string slice]
: SCSS/Sass のインクルードパスを追加します。パスは、プロジェクト ディレクトリからの相対パスである必要があります。

```go-html-template
{{ $options := (dict "targetPath" "style.css" "outputStyle" "compressed" "enableSourceMap" (not hugo.IsProduction) "includePaths" (slice "node_modules/myscss")) }}
{{ $style := resources.Get "sass/main.scss" | resources.ToCSS $options }}
```

{{% note %}}
`outputStyle` に `compressed` を設定すると、Sass/SCSS ファイルのミニファイ (minification) を、より一般的な [`resources.Minify`]({{< ref "minification">}}) よりも適切に処理できるようになります。
{{% /note %}}



## 訳注

[^1]: [LibSass](https://sass-lang.com/libsass) は現在、**非推奨** となっており、その代わりに [Dart Sass](https://sass-lang.com/dart-sass) を使うようにアナウンスされています。インストールには、若干速度の遅い npm コマンド (`npm i sass-embedded`) でインストールするか、Mac なら brew、Windows なら Chocolatey でインストールできます。ただし、Dart Sass Embedded の最新版は、2023年1月2日現在、[1.57.1](https://github.com/sass/dart-sass-embedded/releases/tag/1.57.1) ですが、Chocolatey で配布されているバージョンは `1.56.1` です。
