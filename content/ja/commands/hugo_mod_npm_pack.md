---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod npm サブコマンドは、プロジェクト用の合成 package.json ファイルを準備し、書き込みます。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 84
publishdate: "2017-02-01"
sections_weight: 84
toc: false
weight: 84
draft: false
slug: hugo_mod_npm_pack
title: hugo mod npm pack
---
## hugo mod npm pack

実験的な機能: プロジェクト用の合成 package.json ファイルを準備し、書き込みます。

### 概要 {#synopsis}

プロジェクト用の合成 package.json ファイルを準備し、書き込みます。

最初の実行時に、プロジェクト ルートに "package.hugo.json" がなければ作成されます。このファイルは、基本的な依存関係が設定されたテンプレートファイルとして使用されます。 

このセットは、依存関係ツリーで見つかったすべての "package.hugo.json" ファイルとマージされ、プロジェクトに最も近いバージョンが選択されます。

このコマンドは「実験的」であるとマークされています。私たちはこのコマンドが素晴らしいアイデアだと考えていますので、Hugo から削除される可能性は低いですが、「実運用」でこのコマンドをテストして感触を確かめる必要があるため、Hugo の将来のバージョンでは変更される可能性があります。


```bash
hugo mod npm pack [flags]
```

### オプション {#options}

```bash
  -h, --help   pack サブコマンドのヘルプ
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

* [hugo mod npm](/commands/hugo_mod_npm/)	 - さまざまな npm ヘルパーです

