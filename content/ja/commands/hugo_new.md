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
    weight: 90
publishdate: "2017-02-01"
sections_weight: 90
toc: false
weight: 90
draft: false
slug: hugo_new
title: hugo new
---
## hugo new

サイトの新しいコンテンツを作成します

### 概要 {#synopsis}

新しいコンテンツファイルを作成し、日付とタイトルを自動的に設定します。
指定されたパスに基づいて、作成するファイルの種類を推測します。

また、`-k KIND` で種類を指定することもできます。

テーマまたはサイトでアーキタイプが提供されている場合は、それらが使用されます。

サイトのルートディレクトリで実行していることを確認してください。

```bash
hugo new [path] [flags]
```

### オプション {#options}

```bash
  -b, --baseURL string             ルートへのホスト名 (およびパス) で、たとえば、 https://spf13.com/
  -D, --buildDrafts                下書きとしてマークされたコンテンツを含めます
  -E, --buildExpired               期限切れのコンテンツを含めます
  -F, --buildFuture                公開日が将来のコンテンツを含めます
      --cacheDir string            キャッシュ ディレクトリへのファイルシステムのパス。 デフォルトは、 $TMPDIR/hugo_cache/ です
      --cleanDestinationDir        静的ディレクトリに見つからないファイルを宛先から削除します
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
  -c, --contentDir string          コンテンツ ディレクトリへのファイルシステムのパス
  -d, --destination string         ファイルを書き込むファイルシステムのパス
      --disableKinds strings       さまざまな種類のページ (ホーム、RSS など) を無効にします
      --editor string              提供されている場合、このエディターで新しいコンテンツを編集します
      --enableGitInfo              ページに Git リビジョン、日付、作成者、CODEOWNERS 情報を追加します
  -e, --environment string         ビルド環境
  -f, --force                      ファイルが既に存在する場合は上書きします
      --forceSyncStatic            static が変更されたときに、すべてのファイルをコピーします
      --gc                         ビルド後にいくつかのクリーンアップ タスク (未使用のキャッシュ ファイルを削除する) を実行できるようにします
  -h, --help                       new サブコマンドのヘルプ
      --ignoreCache                キャッシュ ディレクトリを無視します
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
  -k, --kind string                作成するコンテンツタイプ
  -l, --layoutDir string           レイアウト ディレクトリへのファイルシステムのパス
      --minify                     サポートされている出力形式 (HTML、XML など) をミニファイします
      --noBuildLock                .hugo_build.lock ファイルを作成しません
      --noChmod                    ファイルのパーミッション モードを同期しません
      --noTimes                    ファイルの更新時刻を同期しません
      --panicOnWarning             最初の WARNING ログでパニック panic します
      --poll string                ファイルシステムの変更を監視するためにポーリング ベースのアプローチを使用するには、これをポーリング間隔に設定します (たとえば、 --poll 700ms)
      --printI18nWarnings          不足している翻訳を表示します
      --printMemoryUsage           一定間隔でメモリ使用量を画面に表示します
      --printPathWarnings          重複するターゲットパスなどに関する警告を表示します
      --printUnusedTemplates       未使用のテンプレートに関する警告を表示します
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --templateMetrics            テンプレート実行に関するメトリクスを表示します
      --templateMetricsHints       --templateMetrics と組み合わせると、いくつかの改善のヒントが計算されます
  -t, --theme strings              使用するテーマ (/themes/THEMENAME/ にあります)
      --themesDir string           テーマディレクトリへのファイルシステムのパス
      --trace file                 トレースをファイルに書き出します (一般には有用ではありません)
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
* [hugo new site](/commands/hugo_new_site/)	 - 新しいサイト (スケルトン) を作成します
* [hugo new theme](/commands/hugo_new_theme/)	 - 新しいテーマを作成します

