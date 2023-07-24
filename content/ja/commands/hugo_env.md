---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo env サブコマンドは、Hugo のバージョンと環境情報を表示します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 45
publishdate: "2017-02-01"
sections_weight: 45
toc: false
weight: 45
draft: false
slug: hugo_env
title: hugo env
---
## hugo env

Hugo のバージョンと環境情報を表示します

### 概要 {#synopsis}

Hugo のバージョンと環境情報を表示します。これは、 Hugo のバグレポートに役立ちます。

```bash
hugo env [flags] [args]
```

### オプション {#options}

```bash
  -h, --help   env サブコマンドのヘルプ
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

