---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod vendor サブコマンドは、すべてのモジュールの依存関係を _vendor ディレクトリにベンダリングします。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 86
publishdate: "2017-02-01"
sections_weight: 86
toc: false
weight: 86
draft: false
slug: hugo_mod_vendor
title: hugo mod vendor
---
## hugo mod vendor

すべてのモジュールの依存関係を _vendor ディレクトリにベンダリングします。

### 概要 {#synopsis}

すべてのモジュールの依存関係を _vendor ディレクトリにベンダリングします。

モジュールがベンダリングされている場合、Hugo はそこから依存関係を探します。


```bash
hugo mod vendor [flags]
```

### オプション {#options}

```bash
  -h, --help   vendor サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
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

