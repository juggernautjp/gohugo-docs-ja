---
title: BSD
linkTitle: BSD
description: BSD 派生製品に Hugo をインストールします。
categories: [installation]
menu:
  docs:
    parent: installation
    weight: 50
toc: true
weight: 50
---
{{% readfile file="/content/ja/installation/common/01-editions.md" %}}

{{% readfile file="/content/ja/installation/common/02-prerequisites.md" %}}

{{% readfile file="/content/ja/installation/common/03-prebuilt-binaries.md" %}}

## リポジトリ パッケージ {#repository-packages}

ほとんどの BSD 派生製品では、一般的にインストールされるアプリケーションのリポジトリを維持しています。これらのリポジトリには [最新リリース][latest release] が含まれていない可能性があることに注意してください。

[latest release]: https://github.com/gohugoio/hugo/releases/latest

### DragonFly BSD

[DragonFly BSD] パッケージ リポジトリには Hugo が含まれています。 以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo pkg install gohugo
```

[DragonFly BSD]: https://www.dragonflybsd.org/

### FreeBSD

[FreeBSD] のパッケージ リポジトリには Hugo が含まれています。 以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo pkg install gohugo
```

[FreeBSD]: https://www.freebsd.org/

### NetBSD

[NetBSD] のパッケージ リポジトリには Hugo が含まれています。 以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo pkgin install go-hugo
```

[NetBSD]: https://www.netbsd.org/

### OpenBSD

[OpenBSD] のパッケージ リポジトリには Hugo が含まれています。 以下のコマンドにより、インストールする Hugo のエディションを選択するよう求められます。

```sh
doas pkg_add hugo
```

[OpenBSD]: https://www.openbsd.org/

{{% readfile file="/content/ja/installation/common/05-build-from-source.md" %}}

## 比較 {#comparison}

|| ビルド済みバイナリ | リポジトリ パッケージ | ソースからのビルド
:--|:--:|:--:|:--:
インストールは簡単か?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
アップグレードは簡単か?|:heavy_check_mark:| さまざま |:heavy_check_mark:
ダウングレードは簡単か?|:heavy_check_mark:| さまざま |:heavy_check_mark:
自動アップデート機能は?|:x:| さまざま |:x:
最新版の提供は?|:heavy_check_mark:| さまざま |:heavy_check_mark:
