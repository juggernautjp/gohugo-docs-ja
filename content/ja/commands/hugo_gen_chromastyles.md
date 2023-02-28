---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo gen chromastyles サブコマンドは、 Chroma コード ハイライター用の CSS スタイルシートを生成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 51
publishdate: "2017-02-01"
sections_weight: 51
toc: false
weight: 51
draft: false
slug: hugo_gen_chromastyles
title: hugo gen chromastyles
---
## hugo gen chromastyles

Chroma コード ハイライター用の CSS スタイルシートを生成します

### 概要 {#synopsis}

特定のスタイルの Chroma コード ハイライターの CSS スタイルシートを生成します。 
設定で markup.highlight.noClasses が無効になっている場合、このスタイルシートが必要です。

利用可能なスタイルのプレビューについては、https://xyproto.github.io/splash/docs/all.html を参照してください。

```bash
hugo gen chromastyles [flags]
```

### オプション {#options}

```bash
  -h, --help                    chromastyles サブコマンドのヘルプ
      --highlightStyle string   行のハイライト表示に使われるスタイル (https://github.com/alecthomas/chroma を参照) (デフォルトは、 "bg:#ffffcc")
      --linesStyle string       行番号に使用されるスタイル (https://github.com/alecthomas/chroma を参照)
      --style string            ハイライターのスタイル (https://xyproto.github.io/splash/docs/ を参照) (デフォルトは、 "friendly")
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               sHugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
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

