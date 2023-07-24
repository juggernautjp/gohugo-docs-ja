---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod サブコマンドは、Hugo モジュールの各種ヘルパーです。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 80
publishdate: "2017-02-01"
sections_weight: 80
toc: false
weight: 80
draft: false
slug: hugo_mod
title: hugo mod
---
## hugo mod

Hugo モジュールの各種ヘルパーです。

### 概要 {#synopsis}

プロジェクトの依存関係グラフでモジュールを管理するのに役立つさまざまなヘルパーです。

ここでのほとんどの操作は、システムにインストールされた Go バージョン (Go 1.12 以降) と関連する VCS クライアント (典型的には Git) を必要とします。
テーマ内のモジュールだけを操作する場合や、"hugo mod vendor" でモジュールをベンダリングしている場合は必要ありません。


Hugo は常に、_vendor ディレクトリ (-ignoreVendorPaths フラグが指定されていない場合)、Go モジュール、または themes ディレクトリ内のフォルダの順で、サイト設定で定義されたコンポーネントを解決することから始めることに注意してください。

詳細については、https://gohugo.io/hugo-modules/ を参照してください。


### オプション {#options}

```bash
  -h, --help                       mod サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
  -d, --destination string         ファイルを書き込むファイルシステムのパス
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --logLevel string            ログレベル (debug|info|warn|error)
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
  -v, --verbose                    詳細出力 (冗長表示)
```

### 関連項目 {#see-also}

* [hugo](/commands/hugo/)	 - あなたのサイトをビルド (構築) します
* [hugo mod clean](/commands/hugo_mod_clean/)	 - 現在のプロジェクトの Hugo モジュールキャッシュを削除します
* [hugo mod get](/commands/hugo_mod_get/)	 - 現在の Hugo プロジェクトにおける依存関係を解決します
* [hugo mod graph](/commands/hugo_mod_graph/)	 - モジュールの依存関係グラフを表示します
* [hugo mod init](/commands/hugo_mod_init/)	 - このプロジェクトを Hugo モジュールとして初期化します
* [hugo mod npm](/commands/hugo_mod_npm/)	 - さまざまな npm ヘルパーです
* [hugo mod tidy](/commands/hugo_mod_tidy/)	 - go.mod と go.sum の未使用のエントリを削除します
* [hugo mod vendor](/commands/hugo_mod_vendor/)	 - すべてのモジュールの依存関係を _vendor ディレクトリにベンダリングします
* [hugo mod verify](/commands/hugo_mod_verify/)	 - 依存関係を確認します

