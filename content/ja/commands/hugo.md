---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo コマンドは、あなたのサイトをビルド (構築) します。
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
title: "hugo (cli)"
---
## hugo

hugo コマンドは、あなたのサイトをビルド (構築) します。

### 概要 {#synopsis}

hugo はメインコマンドで、Hugo サイトをビルドするために使用します。

Hugo は、spf13 と Go の仲間たちが愛情を込めて作った、高速で柔軟な静的サイトジェネレータです。

完全なドキュメントは https://gohugo.io/ で入手できます。

```bash
hugo [flags]
```

### オプション {#options}

```bash
  -b, --baseURL string             ルートへのホスト名 (およびパス) で、たとえば、 https://spf13.com/
  -D, --buildDrafts                下書きとしてマークされたコンテンツを含めます
  -E, --buildExpired               期限切れのコンテンツを含めます
  -F, --buildFuture                公開日が将来のコンテンツを含めます
      --cacheDir string            キャッシュ ディレクトリへのファイルシステム パスで、デフォルトは $TMPDIR/hugo_cache/ です。
      --cleanDestinationDir        静的ディレクトリに見つからない宛先からファイルを削除します
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
      --config string              設定ファイル (デフォルトは、 path/config.yaml|json|toml)
      --configDir string           設定ディレクトリ (デフォルトは、 "config")
  -c, --contentDir string          コンテンツディレクトリへのファイルシステムのパス
      --debug                      デバッグ出力
  -d, --destination string         ファイルを書き込むファイルシステムのパス
      --disableKinds strings       さまざまな種類のページ (ホーム、RSS など) を無効にします
      --enableGitInfo              ページに Git リビジョン、日付、作成者、CODEOWNERS 情報を追加します
  -e, --environment string         ビルド環境
      --forceSyncStatic            static が変更されたときにすべてのファイルをコピーします。
      --gc                         ビルド後にいくつかのクリーンアップ タスク (未使用のキャッシュ ファイルを削除する) を実行できるようにします。
  -h, --help                       hugo コマンドのヘルプ
      --ignoreCache                キャッシュディレクトリを無視します
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
  -l, --layoutDir string           レイアウト ディレクトリへのファイルシステムのパス
      --log                        ロギングを有効にします
      --logFile string             ログファイルのパス (設定されている場合、ログが自動的に有効になります)
      --minify                     サポートされている出力形式 (HTML、XML など) をミニファイします
      --noBuildLock                .hugo_build.lock ファイルを作成しません
      --noChmod                    ファイルのパーミッション モードを同期しません
      --noTimes                    ファイルの更新時刻を同期しません
      --panicOnWarning             最初の警告 (WARNING) ログでパニック (panic) します
      --poll string                (たとえば --poll 700ms により) ポーリング間隔に設定して、ポーリング ベースのアプローチを使用してファイルシステムの変更を監視します。
      --printI18nWarnings          不足している翻訳を出力します
      --printMemoryUsage           一定間隔でメモリ使用量を画面に表示します
      --printPathWarnings          ターゲットパスの重複などに関する警告を表示します
      --printUnusedTemplates       未使用のテンプレートについて警告を出力します
      --quiet                      クワイエットモード (通知オフ) でビルドします
      --renderToMemory             メモリにレンダリングします (ベンチマークテストにのみ有効)
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --templateMetrics            テンプレート実行に関する指標 (メトリクス) を表示します
      --templateMetricsHints       --templateMetrics と組み合わせると、いくつかの改善のヒントが計算されます
  -t, --theme strings              (/themes/THEMENAME/ にある) 使用するテーマ 
      --themesDir string           テーマディレクトリへのファイルシステムのパス
      --trace file                 トレースをファイルに書き込みます (一般的には役に立ちません)
  -v, --verbose                    詳細出力 (冗長表示)
      --verboseLog                 詳細ログ出力
  -w, --watch                      ファイルシステムの変更を監視し、必要に応じて再作成します
```

### 関連項目 {#see-also}

* [hugo completion](/commands/hugo_completion/)	 - 指定されたシェルのオートコンプリート スクリプトを生成します
* [hugo config](/commands/hugo_config/)	 - サイト設定を出力します
* [hugo convert](/commands/hugo_convert/)	 - コンテンツをさまざまな形式に変換します
* [hugo deploy](/commands/hugo_deploy/)	 - サイトをクラウド プロバイダーにデプロイします
* [hugo env](/commands/hugo_env/)	 - Hugo のバージョンと環境情報を表示します
* [hugo gen](/commands/hugo_gen/)	 - いくつかの便利なジェネレーターを集めたものです
* [hugo import](/commands/hugo_import/)	 - 他のサイトからサイトをインポートします
* [hugo list](/commands/hugo_list/)	 - さまざまな種類のコンテンツを一覧表示します
* [hugo mod](/commands/hugo_mod/)	 - Hugo モジュールの各種ヘルパーです
* [hugo new](/commands/hugo_new/)	 - サイトの新しいコンテンツを作成します
* [hugo server](/commands/hugo_server/)	 - 高性能な Web サーバーを起動します
* [hugo version](/commands/hugo_version/)	 - Hugo のバージョン番号を表示します

