---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo new サブコマンドは、サイトの新しいコンテンツを作成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 90
publishdate: "2017-02-01"
sections_weight: 90
toc: false
weight: 90
draft: false
slug: hugo_new
title: hugo new
---
## hugo new

サイトの新しいコンテンツを作成します

### 概要 {#synopsis}

新しいコンテンツファイルを作成し、日付とタイトルを自動的に設定します。
指定されたパスに基づいて、作成するファイルの種類を推測します。

また、`-k KIND` で種類を指定することもできます。

テーマまたはサイトでアーキタイプが提供されている場合は、それらが使用されます。

サイトのルートディレクトリで実行していることを確認してください。

```bash
hugo new [path] [flags]
```

### オプション {#options}

```bash
  -h, --help                       new サブコマンドのヘルプ
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

* [hugo](/commands/hugo/)	 - あなたのサイトをビルド (構築) します
* [hugo new content](/commands/hugo_new_content/)	 - サイトの新しいコンテンツを作成します
* [hugo new site](/commands/hugo_new_site/)	 - 新しいサイト (スケルトン) を作成します
* [hugo new theme](/commands/hugo_new_theme/)	 - 新しいテーマ (スケルトン) を作成します

