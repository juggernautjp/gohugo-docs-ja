---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo config サブコマンドは、サイト設定を表示します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 20
publishdate: "2017-02-01"
sections_weight: 20
toc: false
weight: 20
draft: false
slug: hugo_config
title: hugo config
url: /commands/hugo_config
---
## hugo config

サイト設定を表示します

### 概要 {#synopsis}

サイト設定 (デフォルトとカスタムの両方の設定) を表示します。

```bash
hugo config [command] [flags]
```

### オプション {#options}

```bash
  -b, --baseURL string      ルートへのホスト名 (およびパス)、例: https://spf13.com/
      --cacheDir string     キャッシュディレクトリへのファイルシステムのパス。デフォルト: $TMPDIR/hugo_cache_$USER/
  -c, --contentDir string   コンテンツディレクトリへのファイルシステムのパス
      --format string       希望するファイル形式 (toml、yaml、json) (デフォルトは "toml")
  -h, --help                config サブコマンドのヘルプ
      --lang string         設定を表示する言語。 デフォルトは最初に定義された言語です。
  -t, --theme strings       使用するテーマ (/messages/THEMENAME/ に置かれた)
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
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
* [hugo config mounts](/commands/hugo_config_mounts/)	 - 設定されたファイルのマウントを表示します

