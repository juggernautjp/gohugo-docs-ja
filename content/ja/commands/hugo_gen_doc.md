---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo gen doc サブコマンドは、Hugo CLI 用の Markdown ドキュメントを生成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 52
publishdate: "2017-02-01"
sections_weight: 52
toc: false
weight: 52
draft: false
slug: hugo_gen_doc
title: hugo gen doc
---
## hugo gen doc

Hugo CLI 用の Markdown ドキュメントを生成します。

### 概要 {#synopsis}

Hugo CLI 用の Markdown ドキュメントを生成します。

このコマンドは、主に、Hugo のコマンドラインインタフェースの最新版のドキュメントである、https://gohugo.io/ を作成するために使用されます。

コマンドごとに 1 つの Markdown ファイルを作成し、Hugo のレンダリングに適したフロントマター付けます。

```bash
hugo gen doc [flags]
```

### オプション {#options}

```bash
      --dir string   ドキュメントを書き込むディレクトリ (デフォルトは、 "/tmp/hugodoc/")
  -h, --help         doc サブコマンドのヘルプ
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

* [hugo gen](/commands/hugo_gen/)	 - いくつかの便利なジェネレーターのコレクションです

