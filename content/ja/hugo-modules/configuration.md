---
categories:
- hugo modules
date: "2019-07-24"
description: このページでは、モジュールの設定オプションについて説明します。
draft: false
keywords:
- themes
- source
- organization
- directories
linktitle: モジュールを設定する
menu:
  docs:
    parent: modules
    weight: 20
title: モジュールを設定する
toc: true
weight: 20
---

## モジュールの設定: トップレベル {#module-config-top-level}

{{< code-toggle file="hugo">}}
[module]
noVendor = ""
proxy = "direct"
noProxy = "none"
private = "*.*"
replacements = ""
workspace = "off"
{{< /code-toggle >}}

noVendor
: ベンダリングの際にスキップするオプションの glob パターンマッチング モジュール パス (たとえば、"github.com/**") 

vendorClosest
: 有効にすると、それを使用するモジュールに最も近いベンダリングされたモジュールが選択されます。 デフォルトの動作は、最初のものを選択します。 特定のモジュール パスの依存関係は 1 つしか存在できないため、一度使用すると再定義できないことに注意してください。

proxy
: リモートモジュールのダウンロードに使用するプロキシサーバーを定義します。デフォルトは `direct` で、"git clone" などの意味になります。

noProxy
: 上記で設定したプロキシを使用してはならないパスに一致するカンマ区切りの glob リスト。

private
: プライベートとして扱うべきパスと一致するカンマ区切りの glob リスト。

workspace
: 使用するワークスペース ファイル。 これにより、Go ワークスペース モードが有効になります。 これは OS 環境経由でも設定できることに注意してください。 `export HUGO_MODULE_WORKSPACE=/my/hugo.work` これは Go 1.18 以降でのみ機能します。 Hugo `v0.109.0` では、デフォルトを `off` に変更し、作業ディレクトリを基準とした相対的な作業ファイル名を解決するようになりました。

replacements
: モジュールパスからディレクトリへのマッピングをカンマで区切ったリスト、例えば `github.com/bep/my-theme -> ../..,github.com/bep/shortcodes -> /some/path`。これは主にモジュールの一時的なローカル開発に便利で、その場合は環境変数として保存するとよいでしょう。相対パスは [themesDir](/getting-started/configuration/#all-configuration-settings) からの相対パスです。絶対パスは許可されています。

上記の用語は、Go モジュールの対応する用語に直接対応していることに注意してください。これらの設定のいくつかは、OS の環境変数として設定するのが自然でしょう。例として、使用するプロキシサーバーを設定する場合は、以下のようにします。

```bash
env HUGO_MODULE_PROXY=https://proxy.example.org hugo
```

{{< gomodules-info-ja >}}

## モジュールの設定: hugoVersion {#module-config-hugoVersion}

もし、モジュールが動作するために特定のバージョンの Hugo を必要とする場合、 `module` セクションでそのことを指定することができ、古すぎたり新しすぎたりするバージョンを使っている場合は警告されます。

{{< code-toggle file="hugo">}}
[module]
[module.hugoVersion]
  min = ""
  max = ""
  extended = false

{{< /code-toggle >}}

上記のいずれかを省略できます。

min
: サポートする Hugo の最小バージョン (たとえば、`0.55.0`)

max
: サポートする Hugo の最大バージョン (たとえば、`0.55.0`)

extended
: 拡張版 Hugo の必要性の有無。

## モジュールの設定: imports {#module-config-imports}

{{< code-toggle file="hugo">}}
[module]
[[module.imports]]
  path = "github.com/gohugoio/hugoTestModules1_linux/modh1_2_1v"
  ignoreConfig = false
  ignoreImports = false
  disable = false
[[module.imports]]
  path = "my-shortcodes"
{{< /code-toggle >}}

path
: 有効な Go モジュールのモジュールパス (たとえば、`github.com/gohugoio/myShortcodes`) か、テーマ フォルダーに保存されているモジュールのディレクトリ名のどちらかを使用します。

ignoreConfig
: 有効にすると、モジュール設定ファイル (たとえば、`hugo.toml`) はロードされません。また、依存関係にあるモジュールのロードも停止することに注意してください。

ignoreImports
: 有効にすると、モジュールのインポートに従わなくなります。

disable
: `true` に設定すると、`go.*` ファイルにバージョン情報を残したまま、モジュールを無効化できます。

noMounts
: このインポートでは、フォルダーーをマウントしません。

noVendor
: このインポートをベンダーにしません (メインプロジェクトでのみ許可されます)。

{{< gomodules-info-ja >}}

## モジュールの設定: mounts {#module-config-mounts}

{{% note %}}
Hugo 0.56.0 で `mounts` 設定が導入されたとき、既存の `contentDir` や `staticDir` などの設定を保存して、既存のすべてのサイトがそのまま動作するように気をつけました。しかし、両方があってはいけません。`mounts` セクションを追加したら、古い `contentDir`、`staticDir` などの設定を削除してください。
{{% /note %}}

{{% note %}}
マウントを追加すると、当該ターゲット ルートのデフォルト マウントは無視されます。このため、必ず明示的に追加してください。
{{% /note %}}

**デフォルト マウント**
{{< code-toggle file="hugo" >}}
[module]
[[module.mounts]]
    source="content"
    target="content"
[[module.mounts]]
    source="static"
    target="static"
[[module.mounts]]
    source="layouts"
    target="layouts"
[[module.mounts]]
    source="data"
    target="data"
[[module.mounts]]
    source="assets"
    target="assets"
[[module.mounts]]
    source="i18n"
    target="i18n"
[[module.mounts]]
    source="archetypes"
    target="archetypes"
{{< /code-toggle >}}

source
: マウントのソースディレクトリです。メインプロジェクトでは、これはプロジェクト相対でも絶対でも、またシンボリックリンクでもかまいません。他のモジュールでは、プロジェクト相対である必要があります。

target
: Hugo の仮想ファイルシステムにマウントされる場所です。Hugo のコンポーネントフォルダーである `static`、`content`、`layouts`、`data`、`assets`、`i18n`、`archetypes` のいずれかを先頭に指定する必要があります。たとえば、 `content/blog` を指定します。

lang
: 言語コードで、たとえば "en" を指定します。マルチホストモードでは、 `content` マウントと `static` マウントにのみ関係します。

includeFiles (string または slice)
: インクルードするファイルやディレクトリにマッチする1つ以上の [glob](https://github.com/gobwas/glob) パターンを指定します。 `excludeFiles` が設定されていない場合は、 `includeFiles` にマッチするファイルがマウントされます。

glob パターンは `source` ルートから始まるファイル名にマッチし、Windows でも Unix スタイルのスラッシュを持つはずです。`/` はマウントルートにマッチし、`**` はスーパー アスタリスクとして、たとえば `/posts/**.jpg` のようにすべてのディレクトリに再帰的にマッチできます。

検索では大文字と小文字が区別されません。

excludeFiles (string または slice)
: 除外するファイルに一致する 1 つ以上の glob パターンです。

**例**
{{< code-toggle file="hugo" >}}
[module]
[[module.mounts]]
    source="content"
    target="content"
    excludeFiles="docs/*"
[[module.mounts]]
    source="node_modules"
    target="assets"
[[module.mounts]]
    source="assets"
    target="assets"
{{< /code-toggle >}}
