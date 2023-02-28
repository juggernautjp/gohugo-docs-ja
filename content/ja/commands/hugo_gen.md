---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo gen サブコマンドは、いくつかの便利なジェネレーターのコレクションです。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 50
publishdate: "2017-02-01"
sections_weight: 50
toc: false
weight: 50
draft: false
slug: hugo_gen
title: hugo gen
---
## hugo gen

いくつかの便利なジェネレーターのコレクションです。

### オプション {#options}

```bash
  -h, --help   gen サブコマンドのヘルプ
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
* [hugo gen chromastyles](/commands/hugo_gen_chromastyles/)	 - Chroma コード ハイライター用の CSS スタイルシートを生成します
* [hugo gen doc](/commands/hugo_gen_doc/)	 - Hugo CLI 用の Markdown ドキュメントを生成します
* [hugo gen man](/commands/hugo_gen_man/)	 - Hugo CLI の man ページを生成します

