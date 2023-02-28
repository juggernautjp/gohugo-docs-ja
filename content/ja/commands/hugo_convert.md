---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo convert サブコマンドは、コンテンツをさまざまな形式に変換します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 30
publishdate: "2017-02-01"
sections_weight: 30
toc: false
weight: 30
draft: false
slug: hugo_convert
title: hugo convert
---
## hugo convert

コンテンツをさまざまな形式に変換します

### 概要 {#synopsis}

コンテンツ (フロントマターなど) を異なるフォーマットに変換します。

詳細については、convert のサブコマンドである、 toJSON、toTOML、および toYAML を参照してください。

### オプション {#options}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、--clock 2021-11-06T22:30:00.00+09:00
  -e, --environment string         ビルド環境
  -h, --help                       convert サブコマンドのヘルプ
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
  -o, --output string              ファイルを書き込むファイルシステムのパス
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
      --unsafe                     より安全でない操作を可能にするため、最初にバックアップをとってください
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
* [hugo convert toJSON](/commands/hugo_convert_tojson/)	 - フロントマターを JSON に変換します
* [hugo convert toTOML](/commands/hugo_convert_totoml/)	 - フロントマターを TOML に変換します
* [hugo convert toYAML](/commands/hugo_convert_toyaml/)	 - フロントマターを YAML に変換します

