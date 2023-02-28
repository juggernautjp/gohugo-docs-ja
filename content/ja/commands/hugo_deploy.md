---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo deploy サブコマンドは、サイトをクラウド プロバイダーにデプロイします。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 40
publishdate: "2017-02-01"
sections_weight: 40
toc: false
weight: 40
draft: false
slug: hugo_deploy
title: hugo deploy
---
## hugo deploy

サイトをクラウド プロバイダーにデプロイします

### 概要 {#synopsis}

サイトをクラウド プロバイダーにデプロイします。

詳細なドキュメントについては、[Hugo デプロイ](/hosting-and-deployment/hugo-deploy/) を参照してください。

```bash
hugo deploy [flags]
```

### オプション {#options}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --confirm                    ターゲットに変更を加える前に確認を求めます
      --dryRun                     ドライラン (予行演習)
  -e, --environment string         ビルド環境
      --force                      全ファイルの強制アップロード
  -h, --help                       deploy サブコマンドのヘルプ
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --invalidateCDN              デプロイ ターゲットに記載されている CDN キャッシュを無効にします (デフォルトは、 true)
      --maxDeletes int             削除するファイルの最大数、または無効な場合は -1 (デフォルトは、256)
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --target string              設定ファイルの「デプロイ」セクションからターゲット デプロイを指定します。デフォルトは、最初のものです
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

