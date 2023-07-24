---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo new theme サブコマンドは、新しいテーマを作成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 93
publishdate: "2017-02-01"
sections_weight: 93
toc: false
weight: 93
draft: false
slug: hugo_new_theme
title: hugo new theme
---
## hugo new theme

新しいテーマを作成します

### 概要 {#synopsis}

./themes に [name] という新しいテーマ (スケルトン) を作成します。
新しいテーマはスケルトンです。 タッチしたファイルにコンテンツを追加してください。 
ライセンスの著作権の行にあなたの名前を追加し、必要に応じて theme.toml ファイルを調整します。

```bash
hugo new theme [name] [flags]
```

### オプション {#options}

```bash
  -h, --help                       theme サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、--clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
  -d, --destination string         ファイルを書き込むファイルシステムのパス
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --logLevel string            ログレベル (debug|info|warn|error)
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -v, --verbose                    詳細出力 (冗長表示)
```

### 関連項目 {#see-also}

* [hugo new](/commands/hugo_new/)	 - サイトの新しいコンテンツを作成します

