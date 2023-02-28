---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod clean サブコマンドは、現在のプロジェクトの Hugo モジュールキャッシュを削除します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 81
publishdate: "2017-02-01"
sections_weight: 81
toc: false
weight: 81
draft: false
slug: hugo_mod_clean
title: hugo mod clean
---
## hugo mod clean

現在のプロジェクトの Hugo モジュールキャッシュを削除します。

### 概要 {#synopsis}

現在のプロジェクトの Hugo モジュールキャッシュを削除します。

このコマンドを実行した後、次回 "hugo" を実行したときに、すべての依存関係が再ダウンロードされることに注意してください。

また、"modules" ファイルキャッシュに正の maxAge を設定した場合、"hugo --gc" の一部としてクリーンアップされることに注意してください。



```bash
hugo mod clean [flags]
```

### オプション {#options}

```bash
      --all              clean entire module cache
  -h, --help             clean サブコマンドのヘルプ
      --pattern string   クリーンアップするモジュールパスのパターン マッチング (設定されていない場合は全て) で、たとえば、"**hugo*" です
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

* [hugo mod](/commands/hugo_mod/)	 - Hugo モジュールの各種ヘルパーです

