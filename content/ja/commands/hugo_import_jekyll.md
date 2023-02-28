---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo import jekyll サブコマンドは、Hugo が Jekyll からインポートします。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 61
publishdate: "2017-02-01"
sections_weight: 61
toc: false
weight: 61
draft: false
slug: hugo_import_jekyll
title: hugo import jekyll
---
## hugo import jekyll

Hugo が Jekyll からインポートします

### 概要 {#synopsis}

Hugo が Jekyll からインポートします。

Jekyll からのインポートには 2 つのパスが必要です。 
たとえば、 `hugo import jekyll jekyll_root_path target_path` です。

```bash
hugo import jekyll [flags]
```

### オプション {#options}

```bash
      --force   空でないターゲット ディレクトリへのインポートを許可します
  -h, --help    jekyll サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --log                        ロギングを有効にします
      --logFile string             ログファイルのパス (設定されている場合、ログが自動的に有効になります)
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
  -v, --verbose                    詳細出力 (冗長表示)
      --verboseLog                 詳細ログ出力
```

### SEE ALSO

* [hugo import](/commands/hugo_import/)	 - 他からサイトをインポートします

