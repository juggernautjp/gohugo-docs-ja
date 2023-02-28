---
title: Windows
linkTitle: Windows
description: Windows に Hugo をインストールします。
categories: [installation]
menu:
  docs:
    parent: installation
    weight: 40
toc: true
weight: 40
---
{{% readfile file="/content/ja/installation/common/01-editions.md" %}}

{{% readfile file="/content/ja/installation/common/02-prerequisites.md" %}}

{{% readfile file="/content/ja/installation/common/03-prebuilt-binaries.md" %}}

## パッケージ マネージャー {#package-managers}

### Chocolatey

[Chocolatey] は、Windows 用の無料でオープンソースのパッケージ マネージャーです。以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
choco install hugo-extended
```

[Chocolatey]: https://chocolatey.org/

### Scoop

[Scoop] は、Windows 用の無料でオープンソースのパッケージ マネージャーです。以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
scoop install hugo-extended
```

[Scoop]: https://scoop.sh/

{{% readfile file="/content/ja/installation/common/04-docker.md" %}}

{{% readfile file="/content/ja/installation/common/05-build-from-source.md" %}}

{{% note %}}
Windows で Hugo の拡張版をソースからビルドする場合、[GCC コンパイラ][GCC compiler] もインストールする必要があります。 これらの [詳細な手順][detailed instructions] を参照してください。

[detailed instructions]: https://discourse.gohugo.io/t/41370
[GCC compiler]: https://gcc.gnu.org/
{{% /note %}}

## 比較 {#comparison}

|| ビルド済みバイナリ | パッケージ マネージャー | Docker | ソースからのビルド
:--|:--:|:--:|:--:|:--:|:--:
インストールは簡単か?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
アップグレードは簡単か?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
ダウングレードは簡単か?|:heavy_check_mark:|:heavy_check_mark: [^2]|:heavy_check_mark:|:heavy_check_mark:
自動アップデート機能は?|:x:|:x: [^1]|:x: [^1]|:x:
最新版の提供は?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:

[^1]: 可能だが、高度な設定が必要です。
[^2]: 以前のバージョンがまだインストールされている場合は簡単です。
