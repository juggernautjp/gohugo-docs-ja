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
hugo deploy [flags] [args]
```

### オプション {#options}

```bash
      --confirm          ターゲットに変更を加える前に確認を求めます
      --dryRun           ドライラン (予行演習)
      --force            全ファイルの強制アップロード
  -h, --help             deploy サブコマンドのヘルプ
      --invalidateCDN    デプロイ ターゲットに記載されている CDN キャッシュを無効にします (デフォルトは、 true)
      --maxDeletes int   削除するファイルの最大数、または無効な場合は -1 (デフォルトは、256)
      --target string    設定ファイルの「デプロイ」セクションからターゲット デプロイを指定します。デフォルトは、最初のものです
      --workers int      ファイルを転送するワーカーの数 (デフォルトは 10)
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 hugo.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
      --debug                      デバッグ出力
  -d, --destination string         ファイルを書き込むファイルシステムのパス
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
      --logLevel string            ログレベル (debug|info|warn|error)
      --quiet                      クワイエットモード (通知オフ) でビルドします
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --themesDir string           テーマディレクトリへのファイルシステムのパス
  -v, --verbose                    詳細出力 (冗長表示)
```

### 関連項目 {#see-also}

* [hugo](/commands/hugo/)	 - あなたのサイトをビルド (構築) します

