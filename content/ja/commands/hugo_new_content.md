---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo new サブコマンドは、サイトの新しいコンテンツを作成します。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 91
publishdate: "2017-02-01"
sections_weight: 91
toc: false
weight: 91
draft: false
slug: hugo_new_content
title: hugo new content
---
## hugo new content

サイトの新しいコンテンツを作成します

### 概要 {#synopsis}

新しいコンテンツファイルを作成し、日付とタイトルを自動的に設定します。
指定されたパスに基づいて、作成するファイルの種類を推測します。

また、`-k KIND` で種類を指定することもできます。

テーマまたはサイトでアーキタイプが提供されている場合は、それらが使用されます。

サイトのルートディレクトリで実行していることを確認してください。

```bash
hugo new content [path] [flags]
```

### オプション {#options}

```bash
  -b, --baseURL string             ルートへのホスト名 (およびパス) で、たとえば、 https://spf13.com/
      --cacheDir string            キャッシュ ディレクトリへのファイルシステムのパス。 デフォルトは、 $TMPDIR/hugo_cache/ です
  -c, --contentDir string          コンテンツ ディレクトリへのファイルシステムのパス
      --editor string              提供されている場合、このエディターで新しいコンテンツを編集します
  -f, --force                      ファイルが既に存在する場合は上書きします
      --format string              希望するファイル形式 (toml、yaml、または json) (デフォルトは "toml")
  -h, --help                       new サブコマンドのヘルプ
  -k, --kind string                作成するコンテンツタイプ
  -t, --theme strings              使用するテーマ (/themes/THEMENAME/ に置かれた)
```

### 親コマンドから継承されたオプション {#options-inherited-from-parent-commands}

```bash
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
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
* [hugo new site](/commands/hugo_new_site/)	 - 新しいサイト (スケルトン) を作成します
* [hugo new theme](/commands/hugo_new_theme/)	 - 新しいテーマを作成します

