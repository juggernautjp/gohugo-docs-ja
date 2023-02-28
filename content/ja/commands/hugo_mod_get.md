---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod get サブコマンドは、現在の Hugo プロジェクトにおける依存関係を解決します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 82
publishdate: "2017-02-01"
sections_weight: 82
toc: false
weight: 82
draft: false
slug: hugo_mod_get
title: hugo mod get
---
## hugo mod get

現在の Hugo プロジェクトにおける依存関係を解決します。

### 概要 {#synopsis}

現在の Hugo プロジェクトにおける依存関係を解決します。

いくつかの例を挙げます。

以下のコマンドは、指定されたモジュールの可能な限り最新のバージョンをインストールします。

```bash
hugo mod get github.com/gohugoio/testshortcodes
```

以下のコマンドは、特定のバージョンをインストールします。

```bash
hugo mod get github.com/gohugoio/testshortcodes@v0.3.0
```

以下のコマンドは、すべてのモジュールの依存関係の最新版をインストールします。

```bash
hugo mod get -u
hugo mod get -u ./... (recursive)
```

詳細は、"go help get" を実行してください。 "go get" で利用可能なすべてのフラグは、ここでも関連しています。

Hugo は常に、_vendor ディレクトリ (-ignoreVendorPaths フラグが指定されていない場合)、Go モジュール、または themes ディレクトリ内のフォルダの順で、サイト設定で定義されたコンポーネントを解決することから始めることに注意してください。

詳細については、https://gohugo.io/hugo-modules/ を参照してください。



```bash
hugo mod get [flags]
```

### オプション {#options}

```bash
  -h, --help   get サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、  --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --log                        ロギングを有効にします
      --logFile string             ログファイルのパス (設定されている場合、ログが自動的に有効になります)
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
  -v, --verbose                    詳細出力 (冗長表示)
      --verboseLog                 詳細ログ出力
```

### 関連項目 {#see-also}

* [hugo mod](/commands/hugo_mod/)	 - Hugo モジュールの各種ヘルパーです

