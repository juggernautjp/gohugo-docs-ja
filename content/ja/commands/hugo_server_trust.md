---
categories:
- commands
aliases: []
date: "2017-02-01"
lastmod: "2023-07-15"
menu:
  docs:
    parent: commands
    weight: 96
publishdate: "2017-02-01"
sections_weight: 96
toc: false
weight: 96
draft: false
slug: hugo_server_trust
title: hugo server trust
---
## hugo server trust

ローカル CA をシステム トラストストアにインストールします。

```bash
hugo server trust [flags] [args]
```

### オプション {#options}

```bash
  -h, --help        trust サブコマンドのヘルプ
      --uninstall   ローカル CA をアンインストールします (ただし、削除しません)。
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

* [hugo server](/commands/hugo_server/)	 - 高性能な Web サーバーです

