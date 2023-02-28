---
categories:
- commands
aliases: []
date: "2017-02-01"
description: hugo server サブコマンドは、高性能な Web サーバーです。
lastmod: "2017-02-01"
menu:
  docs:
    parent: commands
    weight: 95
publishdate: "2017-02-01"
sections_weight: 95
toc: false
weight: 95
draft: false
slug: hugo_server
title: hugo server
---
## hugo server

高性能な Web サーバーです

### 概要 {#synopsis}

Hugo は、サイトを構築し機能する、独自の Web サーバーを提供します。
hugo サーバーは高性能ですが、オプションが限られた Web サーバーです。
多くの人が本番環境で実行しますが、標準的な動作は人々が開発で使用し、本番環境では、Nginx や Caddy などのより高機能のサーバーを使用することです。

'hugo server' は、レンダリングおよび実行されたコンテンツをディスクに書き込むことを避け、メモリに保存することを好みます。

デフォルトでは、hugo はファイルの変更を監視し、サイトを自動的にリビルドします。 次に、開いているブラウザ ページをライブリロードし、最新のコンテンツをプッシュします。 ほとんどの Hugo サイトはほんの一瞬でビルドされるため、変更を保存したのとほぼ同時に確認することができます。

```bash
hugo server [flags]
```

### オプション {#options}

```bash
      --appendPort                 baseURL にポートを追加します (デフォルトは true)
  -b, --baseURL string             ルートへのホスト名 (およびパス) で、たとえば、 https://spf13.com/
      --bind string                サーバーがバインドするインターフェイス (デフォルトは、 "127.0.0.1")
  -D, --buildDrafts                下書きとしてマークされたコンテンツを含めます
  -E, --buildExpired               期限切れのコンテンツを含めます
  -F, --buildFuture                公開日が将来のコンテンツを含めます
      --cacheDir string            キャッシュ ディレクトリへのファイルシステムのパス。 デフォルトは、 $TMPDIR/hugo_cache/ です
      --cleanDestinationDir        静的ディレクトリに見つからないファイルを宛先から削除します
      --clock string               Hugo が使用する時計を設定します。たとえば、 --clock 2021-11-06T22:30:00.00+09:00
   -c, --contentDir string         コンテンツ ディレクトリへのファイルシステムのパス
  -d, --destination string         ファイルを書き込むファイルシステムのパス
      --disableBrowserError        ブラウザでビルドエラーを表示しません
      --disableFastRender          変更時に完全な再レンダリングを有効にします
      --disableKinds strings       さまざまな種類のページ (ホーム、RSS など) を無効にします
      --disableLiveReload          リビルド時にライブ ブラウザのリロードを有効にせずに監視します
      --enableGitInfo              ページに Git リビジョン、日付、作成者、CODEOWNERS 情報を追加します
      --forceSyncStatic            static が変更されたときに、すべてのファイルをコピーします
      --gc                         ビルド後にいくつかのクリーンアップ タスク (未使用のキャッシュ ファイルを削除する) を実行できるようにします
  -h, --help                       server サブコマンドのヘルプ
      --ignoreCache                キャッシュ ディレクトリを無視します
  -e, --environment string         ビルド環境
      --ignoreVendorPaths string   指定された glob パターンに一致するモジュールパスの _vendor を無視します
  -l, --layoutDir string           レイアウト ディレクトリへのファイルシステムのパス
      --liveReloadPort int         ライブリロード用のポート (つまり、HTTPS プロキシの場合は、443) (デフォルトは、-1)
      --meminterval string         メモリ使用量をポーリングする間隔 (--memstats が必要)。有効な時間単位は、"ns"、"us" (または "µs")、"ms"、"s"、"m"、"h" です。 (デフォルトは、"100ms")
      --memstats string            メモリ使用量をこのファイルに記録します
      --minify                     サポートされている出力形式 (HTML、XML など) をミニファイします
      --navigateToChanged          ライブ ブラウザのリロード時に、変更されたコンテンツ ファイルに移動します
      --noBuildLock                .hugo_build.lock ファイルを作成しません
      --noChmod                    ファイルのパーミッション モードを同期しません
      --noHTTPCache                HTTP キャッシュを防止します
      --noTimes                    ファイルの更新時刻を同期しません
      --panicOnWarning             最初の WARNING ログでパニック panic します
      --poll string                ファイルシステムの変更を監視するためにポーリング ベースのアプローチを使用するには、これをポーリング間隔に設定します (たとえば、 --poll 700ms)
  -p, --port int                   サーバがリッスンするポート番号 (デフォルトは、 1313)
      --printI18nWarnings          不足している翻訳を表示します
      --printMemoryUsage           一定間隔でメモリ使用量を画面に表示します
      --printPathWarnings          重複するターゲットパスなどに関する警告を表示します
      --printUnusedTemplates       未使用のテンプレートに関する警告を表示します
      --renderStaticToDisk         静的ファイルはディスクから、動的ファイルはメモリから提供します
      --renderToDisk               ディスクからすべてのファイルを提供します (デフォルトはメモリからです)
  -s, --source string              ファイルの相対パスを読み取るファイルシステムのパス
      --templateMetrics            テンプレート実行に関するメトリクスを表示します
      --templateMetricsHints       --templateMetrics と組み合わせると、いくつかの改善のヒントが計算されます
  -t, --theme strings              使用するテーマ (/themes/THEMENAME/ にあります)
      --themesDir string           テーマディレクトリへのファイルシステムのパス
      --trace file                 トレースをファイルに書き出します (一般には有用ではありません)
  -w, --watch                      ファイルシステムの変更を監視し、必要に応じて再作成します (デフォルトは、true)
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

