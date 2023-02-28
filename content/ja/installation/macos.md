---
title: macOS
linkTitle: macOS
description: macOS に Hugo をインストールします。
categories: [installation]
menu:
  docs:
    parent: installation
    weight: 20
toc: true
weight: 20
---
{{% readfile file="/content/ja/installation/common/01-editions.md" %}}

{{% readfile file="/content/ja/installation/common/02-prerequisites.md" %}}

{{% readfile file="/content/ja/installation/common/03-prebuilt-binaries.md" %}}

## パッケージ マネージャー {#package-managers}

{{% readfile file="/content/ja/installation/common/homebrew.md" %}}

### MacPorts

[MacPorts] は、macOS 用の無料でオープンソースのパッケージ マネージャーです。以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo port install hugo
```

[MacPorts]: https://www.macports.org/

{{% readfile file="/content/ja/installation/common/04-docker.md" %}}

{{% readfile file="/content/ja/installation/common/05-build-from-source.md" %}}

## 比較 {#comparison}

|| ビルド済みバイナリ | パッケージ マネージャー | Docker | ソースからのビルド
:--|:--:|:--:|:--:|:--:|:--:
インストールは簡単か?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
アップグレードは簡単か?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
ダウングレードは簡単か?|:heavy_check_mark:|:heavy_check_mark: [^1]|:heavy_check_mark:|:heavy_check_mark:
自動アップデート機能は?|:x:|:x: [^2]|:x: [^2]|:x:
最新版の提供は?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:

[^1]: 以前のバージョンがまだインストールされている場合は簡単です。
[^2]: 可能だが、高度な設定が必要です。
