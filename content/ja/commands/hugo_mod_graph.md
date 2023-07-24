---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod graph サブコマンドは、モジュールの依存関係グラフを表示します。
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
slug: hugo_mod_graph
title: hugo mod graph
---
## hugo mod graph

モジュールの依存関係グラフを表示します。

### 概要 {#synopsis}

モジュールの状態 (disabled, vendored) についての情報を含む、モジュールの依存関係グラフを表示します。
vendored モジュールについては、go.mod からのバージョンではなく、リストされたバージョンであることに注意してください。


```bash
hugo mod graph [flags] [args]
```

### オプション {#options}

```bash
  -b, --baseURL string      ルートへのホスト名 (およびパス)、例: https://spf13.com/
      --cacheDir string     キャッシュディレクトリへのファイルシステムのパス。デフォルト: $TMPDIR/hugo_cache_$USER/
      --clean               検証に失敗した依存関係のモジュール キャッシュを削除します
  -c, --contentDir string   コンテンツディレクトリへのファイルシステムのパス
  -h, --help                graph サブコマンドのヘルプ
  -t, --theme strings       使用するテーマ (/messages/THEMENAME/ に置かれた)
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

* [hugo mod](/commands/hugo_mod/)	 - Hugo モジュールの各種ヘルパーです

