---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo completion bash サブコマンドは、bash 用のオートコンプリート スクリプトを生成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 11
publishdate: "2017-02-01"
sections_weight: 11
toc: false
weight: 11
draft: false
slug: hugo_completion_bash
title: hugo completion bash
---
## hugo completion bash

bash 用のオートコンプリート スクリプトを生成します

### 概要 {#synopsis}

bash シェル用のオートコンプリート スクリプトを生成します。

このスクリプトは、 'bash-completion' パッケージに依存しています。
まだインストールされていない場合は、OS のパッケージ マネージャーからインストールできます。

現在のシェル セッションに補完を読み込むには、以下のコマンドを実行します。

```bash
source <(hugo completion bash)
```

新しいセッションごとに補完をロードするには、以下のコマンドを 1 回だけ実行します。

#### Linux:

```bash
hugo completion bash > /etc/bash_completion.d/hugo
```

#### macOS:

```bash
hugo completion bash > $(brew --prefix)/etc/bash_completion.d/hugo
```

この設定を有効にするには、新しいシェルを起動する必要があります。

```bash
hugo completion bash
```

### オプション {#options}

```bash
  -h, --help              bash サブコマンドのヘルプ 
      --no-descriptions   補完の説明を無効にします
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

* [hugo completion](/commands/hugo_completion/)	 - 指定されたシェル用のオートコンプリート スクリプトを生成します

