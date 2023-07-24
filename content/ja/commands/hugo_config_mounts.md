---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo config mounts サブコマンドは、設定されたファイルのマウントを表示します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 21
publishdate: "2017-02-01"
sections_weight: 21
toc: false
weight: 21
draft: false
slug: hugo_config_mounts
title: hugo config mounts
---
## hugo config mounts

設定されたファイルのマウントを表示します

```bash
hugo config mounts [flags] [args]
```

### オプション {#options}

```bash
  -b, --baseURL string      ルートへのホスト名 (およびパス)、例: https://spf13.com/
      --cacheDir string     キャッシュディレクトリへのファイルシステムのパス。デフォルト: $TMPDIR/hugo_cache_$USER/
  -c, --contentDir string   コンテンツディレクトリへのファイルシステムのパス
  -h, --help                mounts サブコマンドのヘルプ
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

* [hugo config](/commands/hugo_config/)	 - サイト設定を表示します

