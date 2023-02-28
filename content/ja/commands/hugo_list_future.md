---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo list future サブコマンドは、将来の日付の投稿をすべて一覧表示します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 74
publishdate: "2017-02-01"
sections_weight: 74
toc: false
weight: 74
draft: false
slug: hugo_list_future
title: hugo list future
---
## hugo list future

将来の日付の投稿をすべて一覧表示します

### 概要 {#synopsis}

List all of the posts in your content directory which will be posted in the future.

```bash
hugo list future [flags]
```

### オプション {#options}

```bash
  -h, --help   future サブコマンドのヘルプ
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

* [hugo list](/commands/hugo_list/)	 - さまざまな種類のコンテンツを一覧表示します

