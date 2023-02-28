---
categories:
- asset management
date: "2019-03-21"
description: Hugo パイプは、 Babel で JS ファイルを処理できます。
draft: false
keywords: []
menu:
  docs:
    parent: pipes
    weight: 48
publishdate: "2019-03-21"
sections_weight: 48
title: Babel
weight: 48
---

どのような JavaScript リソースファイルでも、 `resources.Babel` を使って別の JavaScript バージョンにトランスパイルできます。この引数はリソースオブジェクトと、オプションとして以下に挙げるオプションのディクテーションを取ります。 Babel は、 [babel cli](https://babeljs.io/docs/en/babel-cli) を使用します。


{{% note %}}
Hugo パイプの Babel は、`@babel/cli` と `@babel/core` JavaScript パッケージを、プロジェクトまたはグローバルにインストールする必要があります (`npm install -g @babel/cli @babel/core`)。同時に、使用する Babel プラグインや preset と一緒にインストールする必要があります (たとえば、`npm install @babel/preset-env --save-dev`)。

Hugo Snap パッケージを使用している場合、Babel とプラグインは Hugo サイトのディレクトリ内にローカルにインストールする必要があります。 たとえば、`g` フラグなしの `npm install @babel/cli @babel/core --save-dev` でインストールします。
{{% /note %}}

### 設定 {#config}

Babel や同様のツールを実行する際に、メインプロジェクトの `node_modules` を `NODE_PATH` に追加しています。この領域では Babel との間で既知の [問題](https://github.com/babel/babel/issues/5618) があるので、(プロジェクト自体ではなく) Hugo モジュールに `babel.config.js` を作成している場合は、プリセット/プラグインをロードするために `require` を使うことをお勧めします。たとえば、以下のように指定します。


```js
module.exports = {
  presets: [
    [
      require("@babel/preset-env"),
      {
        useBuiltIns: "entry",
        corejs: 3,
      },
    ],
  ],
};
```

### オプション {#options}

config [string]
: Babel 設定ファイルへのパスです。 Hugo はデフォルトで、プロジェクトにある `babel.config.js` を探します。これらの設定ファイルの詳細については、[「Babel 設定」](https://babeljs.io/docs/en/configuration) を参照してください。

minified [bool]
: 出力時にできるだけ多くのバイトを節約します

noComments [bool]
: 生成された出力にコメントを書き込みます (デフォルトは true)

compact [bool]
: 余計な空白文字や行末記号を含めません。設定されていない場合、デフォルトは `auto` です。

verbose [bool]
: すべてをログに記録します

sourceMap [string]
: Babel のコンパイルで得られた `inline` または `external` のソースマップを出力します。外部ソースマップは、出力ファイル名+".map" でターゲットに書き込まれます。入力ソースマップは、js.Build と node モジュールから読み込んで、出力ソースマップに結合できます。


### 例 {#examples}

```go-html-template
{{- $transpiled := resources.Get "scripts/main.js" | babel  -}}
```

またはオプション付きで、以下のようにします。

```go-html-template
{{ $opts := dict "noComments" true }}
{{- $transpiled := resources.Get "scripts/main.js" | babel $opts -}}
```
