---
title: ToCSS
linkTitle: Sass を CSS にトランスパイルする
description: Sass を CSS にトランスパイルします。
categories: [asset management]
keywords: []
menu:
  docs:
    parent: hugo-pipes
    weight: 30
weight: 30
signature: ["resources.ToCSS RESOURCE [OPTIONS]", "toCSS RESOURCE [OPTIONS]"]
toc: true
aliases: [/hugo-pipes/transform-to-css/]
---

## 使用方法 {#usage}

Hugo の拡張版に含まれる LibSass トランスパイラを使用して Sass を CSS にトランスパイルするか、[Dart Sass をインストール](#dart-sass) して Sass 言語の最新機能を使用します。

```go-html-template
{{ $options := dict "transpiler" "libsass" "targetPath" "css/style.css" }}
{{ with resources.Get "sass/main.scss" | toCSS $options | minify | fingerprint }}
  <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
{{ end }}
```

Sass には、[SCSS 構文][SCSS] と [インデント構文][indented] という 2 つの形式の構文があります。 Hugo は両方をサポートします。

[scss]: https://sass-lang.com/documentation/syntax#scss
[indented]: https://sass-lang.com/documentation/syntax#the-indented-syntax


## オプション {#options}

transpiler
: (`string`) The transpiler to use, either `libsass` (default) or `dartsass`. Hugo's extended edition includes the LibSass transpiler. To use the Dart Sass transpiler, see the [installation instructions](#dart-sass) below.

targetPath
: (`string`) If not set, the transformed resource's target path will be the original path of the asset file with its extension replaced by `.css`.

vars {{< new-in "0.109.0" >}}
: (`map`) A map of key/value pairs that will be available in the `hugo:vars` namespace. Useful for [initializing Sass variables from Hugo templates](https://discourse.gohugo.io/t/42053/).

```scss
// LibSass
@import "hugo:vars";

// Dart Sass
@use "hugo:vars" as v;
```

outputStyle
: (`string`) LibSass で利用可能な出力スタイルは、 `nested` (デフォルト)、`expanded`、`compact`、`compressed` です。 Dart Sass で利用可能な出力スタイルは、 `expanded` (デフォルト) と `compressed` です。

precision
: (`int`) 浮動小数点演算の精度です。 Dart Sass には適用されません。

enableSourceMap
: (`bool`) `true` の場合、ソースマップを生成します。

sourceMapIncludeSources {{< new-in "0.108.0" >}}
: (`bool`) `true` の場合、生成されたソースマップにソースを埋め込みます。 LibSass には適用されません。

includePaths
: (`slice`) トランスパイラが `@use` と `@import` ステートメントを解決するときに使用する、プロジェクトルートからの相対パスのスライスです。

```go-html-template
{{ $options := dict
  "transpiler" "dartsass"
  "targetPath" "css/style.css"
  "vars" site.Params.styles
  "enableSourceMap" (not hugo.IsProduction) 
  "includePaths" (slice "node_modules/bootstrap/scss")
}}
{{ with resources.Get "sass/main.scss" | toCSS $options | minify | fingerprint }}
  <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
{{ end }}
```

## Dart Sass

Hugo の拡張版には、Sass を CSS にトランスパイルするための [LibSass] が含まれています。
2020年、Sass チームは LibSass を非推奨とし、[Dart Sass] を採用しました。

開発環境と本番環境に Dart Sass をインストールすることで、Sass 言語の最新機能を利用できます。

### インストールの概要 {#installation-overview}

Dart Sass は、 Hugo v0.114.0 以降と互換性があります。

Hugo v0.113.0 以前のバージョンで Embedded Dart Sass [^1] を使用していた場合は、Embedded Dart Sass をアンインストールしてから Dart Sass をインストールしてください。 両方をインストールしている場合、Hugo は Dart Sass を使用します。

Hugo を [Snap パッケージ][snap package] としてインストールする場合、Dart Sass をインストールする必要はありません。
Hugo Snap パッケージには Dart Sass が含まれています。

[^1]: 2023年、Sass チームは Embedded Dart Sass を廃止し、Dart Sass を採用しました。

### 開発環境へのインストール {#installing-in-a-development-environment}

Dart Sass を PATH のどこかにインストールすると、Hugo がそれを見つけます。

OS|パッケージ マネージャー|サイト|インストール方法
:--|:--|:--|:--
Linux|Homebrew|[brew.sh]|`brew install sass/sass/sass`
Linux|Snap|[snapcraft.io]|`sudo snap install dart-sass`
macOS|Homebrew|[brew.sh]|`brew install sass/sass/sass`
Windows|Chocolatey|[chocolatey.org]|`choco install sass`
Windows|Scoop|[scoop.sh]|`scoop install sass`

Linux、macOS、Windows 用の [ビルド済みバイナリ] をインストールすることもできます。

`hugo env` を実行して、アクティブなトランスパイラをリストアップします。

### 本番環境へのインストール {#installing-in-a-production-environment}

[CI/CD][ci/cd] デプロイメント (GitHub Pages、GitLab Pages、Netlify など) の場合は、Hugo がサイトをビルドする前に Dart Sass をインストールするようにワークフローを編集する必要があります [^2]。プロバイダによっては、上記のパッケージ マネージャのいずれかを使用することもできますし、ビルド済みのバイナリをダウンロードして展開することもできます。

[^2]: (a) assets キャッシュの場所を変更していない、(b) [サイト設定][site configuration] で `useResourceCacheWhen` を `never` に設定していない、(c) resources ディレクトリをリポジトリに追加してコミットしている場合は、この作業を行う必要はありません。

#### GitHub Pages

GitHub Pages のビルドに Dart Sass をインストールするには、GitHub Pages のワークフローファイルに以下のステップを追加します。

```yaml
- name: Install Dart Sass
  run: sudo snap install dart-sass
```

GitHub Pages を初めてリポジトリで使う場合、GitHub は Dart Sass を含む Hugo 用の [スターター ワークフロー][starter workflow] を提供しています。
これが一番シンプルな始め方です。

#### GitLab Pages

GitLab Pages のビルドに Dart Sass をインストールするには、`.gitlab-ci.yml` ファイルを以下のようにします。

```yaml
variables:
  HUGO_VERSION: 0.115.1
  DART_SASS_VERSION: 1.63.6
  GIT_DEPTH: 0
  GIT_STRATEGY: clone
  GIT_SUBMODULE_STRATEGY: recursive
  TZ: America/Los_Angeles
image:
  name: golang:1.20-buster
pages:
  script:
    # Dart Sass をインストールする
    - curl -LJO https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz
    - tar -xf dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz
    - cp -r dart-sass/* /usr/local/bin
    - rm -rf dart-sass*
    # Hugo をインストールする
    - curl -LJO https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
    - apt install -y ./hugo_extended_${HUGO_VERSION}_linux-amd64.deb
    - rm hugo_extended_${HUGO_VERSION}_linux-amd64.deb
    # ビルドする
    - hugo --gc --minify
  artifacts:
    paths:
      - public
  rules:
    - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
```

#### Netlify

Netlify のビルドに Dart Sass をインストールするには、`netlify.toml` ファイルを以下のようにします。

```toml
[build.environment]
HUGO_VERSION = "0.115.1"
DART_SASS_VERSION = "1.63.6"
TZ = "America/Los_Angeles"

[build]
publish = "public"
command = """\
  curl -LJO https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz && \
  tar -xf dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz && \
  rm dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz && \
  export PATH=/opt/build/repo/dart-sass:$PATH && \
  hugo --gc --minify \
  """
```

### 例 {#example}

Dart Sass でトランスパイルするには、`resources.ToCSS` に渡されるオプションマップの `transpiler` を `dartsass` に設定します。
たとえば、以下のようにします。

```go-html-template
{{ $options := dict "transpiler" "dartsass" "targetPath" "css/style.css" }}
{{ with resources.Get "sass/main.scss" | toCSS $options | minify | fingerprint }}
  <link rel="stylesheet" href="{{ .RelPermalink }}" integrity="{{ .Data.Integrity }}" crossorigin="anonymous">
{{ end }}
```

### その他 {#miscellaneous}

Hugo をソースからビルドし、`mage test -v` を実行した場合、Dart Sass を Snap パッケージとしてインストールすると、テストは失敗します。
これは、Snap パッケージの[厳密な閉じ込めモデル (strictly confinement model)][strictly confined] によるものです。

[brew.sh]: https://brew.sh/
[chocolatey.org]: https://community.chocolatey.org/packages/sass
[ci/cd]: https://en.wikipedia.org/wiki/CI/CD
[dart sass]: https://sass-lang.com/dart-sass
[libsass]: https://sass-lang.com/libsass
[prebuilt binaries]: https://github.com/sass/dart-sass/releases/latest
[scoop.sh]: https://scoop.sh/#/apps?q=sass
[site configuration]: /getting-started/configuration/#configure-build
[snap package]: /installation/linux/#snap
[snapcraft.io]: https://snapcraft.io/dart-sass
[starter workflow]: https://github.com/actions/starter-workflows/blob/main/pages/hugo.yml
[strictly confined]: https://snapcraft.io/docs/snap-confinement