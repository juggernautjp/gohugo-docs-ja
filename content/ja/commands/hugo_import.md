---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo import サブコマンドは、他からサイトをインポートします。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 60
publishdate: "2017-02-01"
sections_weight: 60
toc: false
weight: 60
draft: false
slug: hugo_import
title: hugo import
---
## hugo import

他からサイトをインポートします。

### 概要 {#synopsis}

Jekyll などの他の Web サイト ジェネレーターからサイトをインポートします。

インポートには、`hugo import jekyll jekyll_root_path target_path` のようなサブコマンドが必要です。

### オプション {#options}

```bash
  -h, --help   import サブコマンドのヘルプ
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

### 関連項目 {#see-also}

* [hugo](/commands/hugo/)	 - あなたのサイトをビルド (構築) します
* [hugo import jekyll](/commands/hugo_import_jekyll/)	 - hugo import from Jekyll

