---
aliases:
- /themes/usage/
- /themes/installing/
- /installing-and-using-themes/
categories:
- hugo modules
date: "2019-07-24"
description: Hugo モジュールを使ってサイトを構築・管理する方法です。
draft: false
keywords:
- install
- themes
- source
- organization
- directories
- usage
- modules
linktitle: Hugo モジュールを使用する
menu:
  docs:
    parent: modules
    weight: 20
sections_weight: 20
title: Hugo モジュールを使用する
toc: true
weight: 20
---

## 前提条件 {#prerequisite}

{{< gomodules-info-ja >}}

## 新しいモジュールを初期化する {#initialize-a-new-module}

新しい Hugo モジュールを初期化するには、`hugo mod init` を使用します。モジュールのパスの推測に失敗した場合は、たとえば以下のように引数として指定する必要があります。

```bash
hugo mod init github.com/gohugoio/myShortcodes
```

[CLI Doc](/commands/hugo_mod_init/) も参照してください。

## テーマにモジュールを使用する {#use-a-module-for-a-theme}

テーマにモジュールを使用する最も簡単な方法は、設定でインポートすることです。

1. 右のコマンドを実行して、Hugo モジュール システムを初期化します。 `hugo mod init github.com/<your_user>/<your_project>`
2. 以下の設定により、テーマをインポートします。

{{< code-toggle file="config" >}}
[module]
  [[module.imports]]
    path = "github.com/spf13/hyde"
{{< /code-toggle >}}

## モジュールを更新する {#update-modules}

モジュールをインポートとして設定に追加すると、モジュールがダウンロードされて追加されます。[「モジュールのインポート」](/hugo-modules/configuration/#module-config-imports) を参照してください。

バージョンの更新や管理を行うには、`hugo mod get` を使用します。

いくつかの例を挙げます。

### すべてのモジュールを更新する {#update-all-modules}

```bash
hugo mod get -u
```

### すべてのモジュールを再帰的に更新する {#update-all-modules-recursively}

```bash
hugo mod get -u ./...
```

### 1 つのモジュールを更新する {#update-one-module}

```bash
hugo mod get -u github.com/gohugoio/myShortcodes
```

### 特定のバージョンを取得する {#get-a-specific-version}

```bash
hugo mod get github.com/gohugoio/myShortcodes@v1.0.7
```

[CLI Doc](/commands/hugo_mod_get/) も参照してください。

## モジュールに変更を加えてテストする {#make-and-test-changes-in-a-module}

プロジェクトにインポートされたモジュールのローカル開発を行う 1 つの方法は、 `go.mod` にあるソースをローカルディレクトリに置き換えるディレクティブを追加することです。

```bash
replace github.com/bep/hugotestmods/mypartials => /Users/bep/hugotestmods/mypartials
```

`hugo server` を実行している場合、設定がリロードされ、`/Users/bep/hugotestmods/mypartials` が監視リストに追加されます。

また、`go.mod` ファイルを修正する代わりに、モジュール設定の [`replacements`](https://gohugo.io/hugo-modules/configuration/#module-config-top-level) オプションを使用することもできます。

## 依存関係グラフの印刷 {#print-dependency-graph}

関連するモジュールディレクトリから `hugo mod graph` を使用すると、ベンダリング、モジュールの置き換え、無効化などの状態を含む依存関係グラフが表示されます。

たとえば、以下のように出力されます。

```bash
hugo mod graph

github.com/bep/my-modular-site github.com/bep/hugotestmods/mymounts@v1.2.0
github.com/bep/my-modular-site github.com/bep/hugotestmods/mypartials@v1.0.7
github.com/bep/hugotestmods/mypartials@v1.0.7 github.com/bep/hugotestmods/myassets@v1.0.4
github.com/bep/hugotestmods/mypartials@v1.0.7 github.com/bep/hugotestmods/myv2@v1.0.0
DISABLED github.com/bep/my-modular-site github.com/spf13/hyde@v0.0.0-20190427180251-e36f5799b396
github.com/bep/my-modular-site github.com/bep/hugo-fresh@v1.0.1
github.com/bep/my-modular-site in-themesdir
```

[CLI Doc](/commands/hugo_mod_graph/) も参照してください。

## モジュールをベンダーする {#vendor-your-modules}

`hugo mod vendor` は、すべてのモジュールの依存関係を `_vendor` フォルダーに書き込み、その後のすべてのビルドに使用します。

**注意事項**:

* モジュールツリーのどのレベルでも `hugo mod vendor` を実行できます。
* ベンダリングは、 `themes` フォルダーに保存されているモジュールを保存しません。
* ほとんどのコマンドは `--ignoreVendorPaths` フラグを受け付け、指定された [Glob](https://github.com/gobwas/glob) パターンにマッチするモジュールパスに対して `_vendor` に含まれるベンダー モジュールを使用しないようにします。

[CLI Doc](/commands/hugo_mod_vendor/) も参照してください。

## Tidy go.mod, go.sum

`hugo mod tidy` を実行して、`go.mod` と `go.sum` の中の未使用のエントリを削除します。

[CLI Doc](/commands/hugo_mod_clean/) も参照してください。

## モジュールキャッシュを消去する {#clean-module-cache}

`hugo mod clean` を実行して、モジュールキャッシュをすべて削除します。

`maxAge` を使用して `modules` キャッシュを設定できることに注意してください。詳細は、[「ファイルキャッシュ」](/getting-started/configuration/#configure-file-caches) を参照してください。

[CLI Doc](/commands/hugo_mod_clean/) も参照してください。
