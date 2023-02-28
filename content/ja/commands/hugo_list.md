---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo list サブコマンドは、さまざまな種類のコンテンツを一覧表示します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 70
publishdate: "2017-02-01"
sections_weight: 70
toc: false
weight: 70
draft: false
slug: hugo_list
title: hugo list
---
## hugo list

さまざまな種類のコンテンツを一覧表示します

### 概要 {#synopsis}

さまざまな種類のコンテンツを一覧表示します。

List は、たとえば `hugo list drafts` のように、サブコマンドを必要とします。

### オプション {#options}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
  -e, --environment string         ビルド環境
  -h, --help                       list サブコマンドのヘルプ
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
      --log                        ロギングを有効にします
      --logFile string             ログファイルのパス (設定されている場合、ログが自動的に有効になります)
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -v, --verbose                    詳細出力 (冗長表示)
      --verboseLog                 詳細ログ出力
```

### 関連項目 {#see-also}

* [hugo](/commands/hugo/)	 - あなたのサイトをビルド (構築) します
* [hugo list all](/commands/hugo_list_all/)	 - すべての投稿を一覧表示します
* [hugo list drafts](/commands/hugo_list_drafts/)	 - すべての下書きを一覧表示します
* [hugo list expired](/commands/hugo_list_expired/)	 - すでに期限切れの投稿をすべて一覧表示します
* [hugo list future](/commands/hugo_list_future/)	 - 将来の日付の投稿をすべて一覧表示します

