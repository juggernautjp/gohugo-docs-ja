---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo gen man サブコマンドは、Hugo CLI の man ページを生成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 53
publishdate: "2017-02-01"
sections_weight: 53
toc: false
weight: 53
draft: false
slug: hugo_gen_man
title: hugo gen man
---
## hugo gen man

Hugo CLI の man ページを生成します

### 概要 {#synopsis}

このコマンドは、Hugo のコマンドライン インターフェイスの最新のマニュアル (man) ページを自動的に生成します。 デフォルトでは、カレントディレクトリの下の "man" ディレクトリに man ページ ファイルが作成されます。

```bash
hugo gen man [flags]
```

### オプション {#options}

```bash
      --dir string   man ページを書き込むディレクトリ (デフォルトは、 "man/")
  -h, --help         man サブコマンドのヘルプ
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

