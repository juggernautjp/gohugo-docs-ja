---
categories:
- asset management
date: "2020-07-20"
description: Hugo パイプは、 [ESBuild](https://github.com/evanw/esbuild) で JavaScript ファイルを処理できます。
draft: false
keywords: []
menu:
  docs:
    parent: pipes
    weight: 45
publishdate: "2020-07-20"
sections_weight: 45
title: JavaScript のビルド
weight: 45
---

任意の JavaScript リソース ファイルは、ファイルパスの文字列または以下にリストされているオプションの dict のいずれかを引数として取る `js.Build` を使用して、トランスパイルおよび[「Tree shaking」](https://developer.mozilla.org/ja/docs/Glossary/Tree_shaking) できます。

### オプション {#options}

targetPath [string]
: 設定されていない場合は、ソースパスがベースとなるターゲットパスとして使用されます。
ターゲットパスの拡張子は、ソースが TypeScript である場合など、ターゲットの MIME タイプが異なる場合に変更される可能性があることに注意してください。

params [map or slice]
: JS ファイルに JSON としてインポートできるパラメータです。たとえば、以下のようになります。

```go-html-template
{{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api")) }}
```
そして、JS ファイルでは、次のように記述します。

```js
import * as params from '@params';
```

これはコンフィグ設定などの小さなデータセットのためのものであることに注意してください。大きなデータの場合は、ファイルを `/assets` に置いたりマウントしたりして、直接インポートしてください。

minify [bool]
: ミニファイ ([minification](https://developer.mozilla.org/ja/docs/Glossary/minification)) の処理は `js.Build` に任せます。

inject [slice]
: このオプションは、グローバル変数を他のファイルからインポートして自動的に置き換えることができます。パス名は `assets` からの相対パスである必要があります。詳細は、 https://esbuild.github.io/api/#inject を参照してください。

shims
: このオプションは、コンポーネントを別のものと交換することができます。一般的な使用例は、本番環境では React などの依存関係を CDN から (_shims_ を使用して) ロードすることですが、開発時には完全にバンドルされた `node_modules` 依存関係で実行します。

```go-html-template
{{ $shims := dict "react" "js/shims/react.js"  "react-dom" "js/shims/react-dom.js" }}
{{ $js = $js | js.Build dict "shims" $shims }}
```

_shim_ ファイルは、以下のようなものです。

```js
// js/shims/react.js
module.exports = window.React;
```

```js
// js/shims/react-dom.js
module.exports = window.ReactDOM;
```

以上により、これらのインポートは両方のシナリオで動作するはずです。

```js
import * as React from 'react'
import * as ReactDOM from 'react-dom';
```

target [string]
: 言語ターゲットです。
  値は、`es5`、`es2015`、`es2016`、`es2017`、`es2018`、`es2019`、`es2020`、`esnext` のいずれかです。
  デフォルトは `esnext` です。

externals [slice]
: 外部依存関係です。 これを使用して、決して実行されないことがわかっている依存関係を削除します。 詳細は、https://esbuild.github.io/api/#external を参照してください


defines [map]
: ビルド時に実行する一連の文字列置換を定義できます。 各キーがその値に置き換えられるマップである必要があります。

```go-html-template
{{ $defines := dict "process.env.NODE_ENV" `"development"` }}
```

format [string]
: 出力形式です。
  値は、`iife`、`cjs`、`esm` のいずれかです。
  デフォルトは `iife` で、自己実行型の関数であり、<script> タグとして含めるのに適しています。

sourceMap
: esbuild から `inline` または `external` のソースマップを生成するかどうかを指定します。 外部ソースマップは、出力ファイル名 + ".map" でターゲットに書き込まれます。 入力ソースマップは js.Build や node モジュールから読み込み、出力ソースマップに結合できます。

### /assets から JS コードをインポートする {"import-js-code-from-assets}

`js.Build` は [Hugo モジュール](/hugo-modules/) で仮想ユニオン ファイルシステムを完全にサポートしています。 この [テスト プロジェクト](https://github.com/gohugoio/hugoTestProjectJSModImports) でいくつかの簡単な例を見ることができますが、要するに、これは以下のことができることを意味します。

```js
import { hello } from 'my/module';
```

そして、階層化されたファイルシステムの `assets/my/module` 内の最上位の `index.{js,ts,tsx,jsx}` に解決されます。

```js
import { hello3 } from 'my/module/hello3';
```

上記のコードは、`Assets/my/module` 内の `hello3.{js,ts,tsx,jsx}` に解決されるでしょう。

`.` で始まるすべてのインポートは、現在のファイルからの相対パスで解決されます。

```js
import { hello4 } from './lib';
```

その他のファイル (たとえば、`JSON` や `CSS`) については、たとえば以下のように、拡張子を含む相対パスで指定する必要があります。

```js
import * as data from 'my/module/data.json';
```

`/assets` の外にあるファイルでのインポート、または `/assets` 内のコンポーネントに解決されないインポートは、[ESBuild](https://esbuild.github.io/) によって、**プロジェクト ディレクトリ** を用いて解決ディレクトリとして解決されます (`node_modules` などを探すときの開始点として使用されます)。 [hugo mod npm pack](/commands/hugo_mod_npm_pack/) も参照してください。 プロジェクトにインポートされた npm 依存関係がある場合は、`hugo` を実行する前に必ず `npm install` を実行する必要があります。

また、たとえば、以下のようにテンプレートから JS ファイルに渡すことができる新しい `params` オプションにも注意してください。

```go-html-template
{{ $js := resources.Get "js/main.js" | js.Build (dict "params" (dict "api" "https://example.org/api")) }}
```

そして、JS ファイルでは、以下のコードを記述します。

```js
import * as params from '@params';
```

Hugo はデフォルトで、インポートをマップする `assets/jsconfig.json` ファイルを生成します。これはコードエディター内のナビゲーションやインテリセンス ヘルプに役立ちますが、必要ない/したくない場合は、[オフにする](/getting-started/configuration/#configure-build) ことができます。


### package.json / node_modules に依存関係を含める {#include-dependencies-in-packagejson-nodemodules}

`/assets` の外にあるファイルでのインポート、または `/assets` 内のコンポーネントに解決されないインポートは、[ESBuild](https://esbuild.github.io/) によって、**プロジェクト ディレクトリ** を用いて解決ディレクトリとして解決されます (`node_modules` などを探すときの開始点として使用されます)。 [hugo mod npm pack](/commands/hugo_mod_npm_pack/) も参照してください。 プロジェクトにインポートされた npm 依存関係がある場合は、`hugo` を実行する前に必ず `npm install` を実行する必要があります。

npm パッケージ (別名、`node_modules` フォルダー内に存在するパッケージ) を解決するための開始ディレクトリは、常にメインプロジェクト フォルダーです。

**注意:** もし、インポートを前提としたテーマ/コンポーネントを開発しており、 `package.json` 内の依存関係に依存している場合は、プロジェクト内のすべての npm 依存関係を統合するツールである [hugo mod npm pack](/commands/hugo_mod_npm_pack/) を読むことを推奨します。


### 例 {#examples}

```go-html-template
{{ $built := resources.Get "js/index.js" | js.Build "main.js" }}
```

あるいはオプションで、以下のように指定します。

```go-html-template
{{ $externals := slice "react" "react-dom" }}
{{ $defines := dict "process.env.NODE_ENV" `"development"` }}

{{ $opts := dict "targetPath" "main.js" "externals" $externals "defines" $defines }}
{{ $built := resources.Get "scripts/main.js" | js.Build $opts }}
<script src="{{ $built.RelPermalink }}" defer></script>
```
