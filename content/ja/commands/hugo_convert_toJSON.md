---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo convert toJSON サブコマンドは、フロントマターを JSON に変換します
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 31
publishdate: "2017-02-01"
sections_weight: 31
toc: false
weight: 31
draft: false
slug: hugo_convert_toJSON
title: hugo convert toJSON
---
## hugo convert toJSON

フロントマターを JSON に変換します

### 概要 {#synopsis}

toJSON は、コンテンツディレクトリ内のすべてのフロントマターを JSON 形式に変換します。

```bash
hugo convert toJSON [flags]
```

### オプション {#options}

```bash
  -h, --help   toJSON サブコマンドのヘルプ
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、--clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --log                        ロギングを有効にします
      --logFile string             ログファイルのパス (設定されている場合、ログが自動的に有効になります)
  -o, --output string              ファイルを書き込むファイルシステムのパス
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
      --unsafe                     より安全でない操作を可能にするため、最初にバックアップをとってください
  -v, --verbose                    詳細出力 (冗長表示)
      --verboseLog                 詳細ログ出力
```

### 関連項目 {#see-also}

* [hugo convert](/commands/hugo_convert/)	 - コンテンツをさまざまな形式に変換します

