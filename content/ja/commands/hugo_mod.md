---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo mod サブコマンドは、Hugo モジュールの各種ヘルパーです。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 80
publishdate: "2017-02-01"
sections_weight: 80
toc: false
weight: 80
draft: false
slug: hugo_mod
title: hugo mod
---
## hugo mod

Hugo モジュールの各種ヘルパーです。

### 概要 {#synopsis}

プロジェクトの依存関係グラフでモジュールを管理するのに役立つさまざまなヘルパーです。

ここでのほとんどの操作は、システムにインストールされた Go バージョン (Go 1.12 以降) と関連する VCS クライアント (典型的には Git) を必要とします。
テーマ内のモジュールだけを操作する場合や、"hugo mod vendor" でモジュールをベンダリングしている場合は必要ありません。


Hugo は常に、_vendor ディレクトリ (-ignoreVendorPaths フラグが指定されていない場合)、Go モジュール、または themes ディレクトリ内のフォルダの順で、サイト設定で定義されたコンポーネントを解決することから始めることに注意してください。

詳細については、https://gohugo.io/hugo-modules/ を参照してください。


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
      --enableGitInfo              ページに Git リビジョン、日付、作成者、CODEOWNERS 情報を追加します
  -e, --environment string         ビルド環境
      --forceSyncStatic            static が変更されたときに、すべてのファイルをコピーします
      --gc                         ビルド後にいくつかのクリーンアップ タスク (未使用のキャッシュ ファイルを削除する) を実行できるようにします
  -h, --help                       mod サブコマンドのヘルプ
      --ignoreCache                キャッシュ ディレクトリを無視します
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
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
* [hugo mod clean](/commands/hugo_mod_clean/)	 - 現在のプロジェクトの Hugo モジュールキャッシュを削除します
* [hugo mod get](/commands/hugo_mod_get/)	 - 現在の Hugo プロジェクトにおける依存関係を解決します
* [hugo mod graph](/commands/hugo_mod_graph/)	 - モジュールの依存関係グラフを表示します
* [hugo mod init](/commands/hugo_mod_init/)	 - このプロジェクトを Hugo モジュールとして初期化します
* [hugo mod npm](/commands/hugo_mod_npm/)	 - さまざまな npm ヘルパーです
* [hugo mod tidy](/commands/hugo_mod_tidy/)	 - go.mod と go.sum の未使用のエントリを削除します
* [hugo mod vendor](/commands/hugo_mod_vendor/)	 - すべてのモジュールの依存関係を _vendor ディレクトリにベンダリングします
* [hugo mod verify](/commands/hugo_mod_verify/)	 - 依存関係を確認します

