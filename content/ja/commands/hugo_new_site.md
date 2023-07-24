---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo new site サブコマンドは、新しいサイト (スケルトン) を作成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 92
publishdate: "2017-02-01"
sections_weight: 92
toc: false
weight: 92
draft: false
slug: hugo_new_site
title: hugo new site
---
## hugo new site

新しいサイト (スケルトン) を作成します

### 概要 {#synopsis}

指定されたディレクトリに新しいサイトを作成します。
新しいサイトは正しい構造になりますが、コンテンツやテーマはまだありません。
新しいコンテンツを作成するには、`hugo new [contentPath]` を使用します。

```bash
hugo new site [path] [flags]
```

### オプション {#options}

```bash
  -f, --force                      空でないディレクトリ内で初期化します
      --format string              設定ファイルの形式 (デフォルトは、 "toml")
  -h, --help                       site サブコマンドのヘルプ
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

* [hugo new](/commands/hugo_new/)	 - サイトの新しいコンテンツを作成します

