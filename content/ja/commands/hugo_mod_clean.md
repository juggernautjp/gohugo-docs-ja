---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod clean サブコマンドは、現在のプロジェクトの Hugo モジュールキャッシュを削除します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 81
publishdate: "2017-02-01"
sections_weight: 81
toc: false
weight: 81
draft: false
slug: hugo_mod_clean
title: hugo mod clean
---
## hugo mod clean

現在のプロジェクトの Hugo モジュールキャッシュを削除します。

### 概要 {#synopsis}

現在のプロジェクトの Hugo モジュールキャッシュを削除します。

```bash
hugo mod clean [flags] [args]
```

### オプション {#options}

```bash
      --all                 モジュールキャッシュ全体を削除します
  -b, --baseURL string      ルートへのホスト名 (およびパス)、例: https://spf13.com/
      --cacheDir string     キャッシュディレクトリへのファイルシステムのパス。デフォルト: $TMPDIR/hugo_cache_$USER/
  -c, --contentDir string   コンテンツディレクトリへのファイルシステムのパス
  -h, --help                clean サブコマンドのヘルプ
      --pattern string      クリーンアップするモジュールパスのパターン マッチング (設定されていない場合は全て) で、たとえば、"**hugo*" です
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

