---
title: Linux
linkTitle: Linux
description: Linux に Hugo をインストールします。
categories: [installation]
menu:
  docs:
    parent: installation
    weight: 30
toc: true
weight: 30
---
{{% readfile file="/content/ja/installation/common/01-editions.md" %}}

{{% readfile file="/content/ja/installation/common/02-prerequisites.md" %}}

{{% readfile file="/content/ja/installation/common/03-prebuilt-binaries.md" %}}

## パッケージ マネージャー {#package-managers}

### Snap

[Snap] は、 Linux 用の無料でオープンソースのパッケージ マネージャーです。 [ほとんどのディストリビューション][most distributions] で利用できる Snap パッケージは、インストールが簡単で、自動的に更新されます。 以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo snap install hugo
```

[most distributions]: https://snapcraft.io/docs/installing-snapd
[Snap]: https://snapcraft.io/

{{% readfile file="/content/ja/installation/common/homebrew.md" %}}

## リポジトリ パッケージ {#repository-packages}

ほとんどの Linux ディストリビューションは、一般的にインストールされるアプリケーションのリポジトリを維持しています。 これらのリポジトリには、[最新リリース][latest release] が含まれていない可能性があることに注意してください。

[latest release]: https://github.com/gohugoio/hugo/releases/latest

### Arch Linux

Linux の [Arch Linux] ディストリビューションの派生製品には、[EndeavourOS]、[Garuda Linux]、[Manjaro] などがあります。以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo pacman -S hugo
```

[Arch Linux]: https://archlinux.org/
[EndeavourOS]: https://endeavouros.com/
[Manjaro]: https://manjaro.org/
[Garuda Linux]: https://garudalinux.org/

### Debian

Linux の [Debian] ディストリビューションの派生製品には、[elementary OS]、 [KDE neon]、[Linux Lite]、[Linux Mint]、[MX Linux]、[Pop!_OS]、[Ubuntu]、[Zorin OS]、などがあります。 以下のコマンドにより、Hugo の拡張版がインストールされます。

```sh
sudo apt install hugo
```

Debian のパッケージは、[最新リリース][latest release] のページからダウンロードすることもできます。

[Debian]: https://www.debian.org/
[elementary OS]: https://elementary.io/
[KDE neon]: https://neon.kde.org/
[Linux Lite]: https://www.linuxliteos.com/
[Linux Mint]: https://linuxmint.com/
[MX Linux]: https://mxlinux.org/
[Pop!_OS]: https://pop.system76.com/
[Ubuntu]: https://ubuntu.com/
[Zorin OS]: https://zorin.com/os/

### Fedora

Linux の [Fedora] ディストリビューションの派生製品には、[CentOS]、[Red Hat Enterprise Linux] などがあります。 以下のコマンドにより、Hugo の拡張版がインストールされます。


```sh
sudo dnf install hugo
```

[CentOS]: https://www.centos.org/
[Fedora]: https://getfedora.org/
[Red Hat Enterprise Linux]: https://www.redhat.com/

### openSUSE

Linux の [openSUSE] ディストリビューションの派生製品には、[GeckoLinux]、[Linux Karmada] などがあります。 以下のコマンドにより、Hugo の拡張版がインストールされます。


```sh
sudo zypper install hugo
```

[GeckoLinux]: https://geckolinux.github.io/
[Linux Karmada]: https://linuxkamarada.com/
[openSUSE]: https://www.opensuse.org/

### Solus

Linux の [Solus] ディストリビューションには、パッケージ リポジトリに Hugo が含まれています。 以下のコマンドにより、Hugo の _標準版_ がインストールされます。

```sh
sudo eopkg install hugo
```

[Solus]: https://getsol.us/home/

{{% readfile file="/content/ja/installation/common/04-docker.md" %}}

{{% readfile file="/content/ja/installation/common/05-build-from-source.md" %}}

## 比較 {#comparison}

|| ビルド済みバイナリ | パッケージ マネージャー | リポジトリ パッケージ | Docker | ソースからのビルド
:--|:--:|:--:|:--:|:--:|:--:
インストールは簡単か?|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
アップグレードは簡単か?|:heavy_check_mark:|:heavy_check_mark:| さまざま |:heavy_check_mark:|:heavy_check_mark:
ダウングレードは簡単か?|:heavy_check_mark:|:heavy_check_mark: [^1]| さまざま |:heavy_check_mark:|:heavy_check_mark:
自動アップデート機能は?|:x:| さまざま [^2]|:x:|:x: [^3]|:x:
最新版の提供は?|:heavy_check_mark:|:heavy_check_mark:| さまざま |:heavy_check_mark:|:heavy_check_mark:

[^1]: 以前のバージョンがまだインストールされている場合は簡単です。
[^2]: Snap パッケージは自動的に更新されます。 Homebrew は高度な設定が必要です。
[^3]: 可能だが、高度な設定が必要です。
