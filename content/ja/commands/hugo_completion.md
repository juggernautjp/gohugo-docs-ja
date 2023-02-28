---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo completion サブコマンドは、指定されたシェル用のオートコンプリート スクリプトを生成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 10
publishdate: "2017-02-01"
sections_weight: 10
toc: false
weight: 10
draft: false
title: hugo completion
slug: hugo_completion
---
## hugo completion

指定されたシェル用のオートコンプリート スクリプトを生成します

### 概要 {#synopsis}

指定されたシェルの hugo コマンド用のオートコンプリート スクリプトを生成します。
生成されたスクリプトの使用方法の詳細については、各サブコマンドのヘルプを参照してください。


### オプション {#options}

```bash
  -h, --help   completion サブコマンドのヘルプ 
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
* [hugo completion bash](/commands/hugo_completion_bash/)	 - bash 用のオートコンプリート スクリプトを生成します
* [hugo completion fish](/commands/hugo_completion_fish/)	 - fish 用のオートコンプリート スクリプトを生成します
* [hugo completion powershell](/commands/hugo_completion_powershell/)	 - powershell 用のオートコンプリート スクリプトを生成します
* [hugo completion zsh](/commands/hugo_completion_zsh/)	 - zsh 用のオートコンプリート スクリプトを生成します 

