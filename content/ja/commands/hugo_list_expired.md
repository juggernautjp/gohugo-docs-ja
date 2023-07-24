---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo list expired サブコマンドは、すでに期限切れの投稿をすべて一覧表示します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 73
publishdate: "2017-02-01"
sections_weight: 73
toc: false
weight: 73
draft: false
slug: hugo_list_expired
title: hugo list expired
---
## hugo list expired

すでに期限切れの投稿をすべて一覧表示します

### 概要 {#synopsis}

コンテンツディレクトリにある、すでに有効期限が切れている投稿をすべて一覧表示します。

```bash
hugo list expired [flags] [args]
```

### オプション {#options}

```bash
  -h, --help   expired サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 hugo.yaml|json|toml)
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

* [hugo list](/commands/hugo_list/)	 - さまざまな種類のコンテンツを一覧表示します

