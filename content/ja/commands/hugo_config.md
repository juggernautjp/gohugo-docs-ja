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
hugo config [flags]
```

### オプション {#options}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
  -e, --environment string         ビルド環境
  -h, --help                       config サブコマンドのヘルプ
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
* [hugo config mounts](/commands/hugo_config_mounts/)	 - 設定されたファイルのマウントを表示します

