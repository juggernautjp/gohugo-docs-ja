---
aliases:
- /assets/
categories:
- asset management
date: "2018-07-14"
description: Hugo パイプは、Hugo のアセット処理関数のセットです。
draft: false
keywords: []
linkTitle: Hugo パイプ
menu:
  docs:
    parent: pipes
    weight: 20
publishdate: "2018-07-14"
sections_weight: 01
title: Hugo パイプ入門
toc: true
weight: 01
---

## /assets 内のリソースを検索する {#find-resources-in-assets}

これは `/assets` 内にマウントされたグローバル リソースに関するものです。 `.Page` にスコープされたリソースについては、[「ページリソース」](/content-management/page-resources/) を参照してください。

[マウント設定](/hugo-modules/configuration/#module-config-mounts) を使用して、Hugo の `assets` 仮想フォルダーに任意のディレクトリをマウントできることに注意してください。

| 関数  | 説明 |
| ------------- | ------------- |
| `resources.Get`  | Get は、指定されたファイル名を Hugo のアセット ファイルシステムから探し出し、さらなる変換に使用できる `Resource` オブジェクトを生成します。詳細は、[「resources.Get と resources.GetRemote でリソースを取得する」](#get-resource-with-resourcesget-and-resourcesgetremote) を参照してください。  |
| `resources.GetRemote`  | `Get` と同じですが、リモートの URL を受け付けます。 [「resources.Get と resources.GetRemote でリソースを取得する」](#get-resource-with-resourcesget-and-resourcesgetremote) を参照してください。 |
| `resources.GetMatch`  | ``GetMatch` は、指定されたパターンにマッチする最初の Resource を見つけます。 見つからない場合は nil を返します。 使用されるルールについてのより完全な説明は、`Match` を参照してください。 |
| `resources.Match`  | `Match` は、指定されたベースパスのプレフィックスにマッチするすべてのリソースを取得します。たとえば、 "\*.png" は、すべての png ファイルにマッチします。 "\*" はパスの区切り文字 (`/`) にはマッチしないので、リソースをサブフォルダにまとめる場合は、たとえば、"images/\*.png" のようにそれを明示する必要があります。 バンドル内の任意の PNG 画像にマッチさせるには "\*\*.png" を指定し、images フォルダー以下のすべての PNG 画像にマッチさせるには "images/\*\*.jpg" を使用します。 マッチングは大文字と小文字を区別しません。`Match` は、ファイルシステムのルートからの相対パスで、Unix スタイルのスラッシュ (`/`) と先行するスラッシュを含まないファイル名を使用して、マッチングします (たとえば、 "images/logo.png")。 完全なルールセットについては、https://github.com/gobwas/glob を参照してください。 |

この名前空間のすべてのテンプレート関数の最新の概要については、 `resources` パッケージの [GoDoc ページ](https://pkg.go.dev/github.com/gohugoio/hugo@v0.93.1/tpl/resources) を参照してください。

## resources.Get と resources.GetRemote でリソースを取得する {#get-resource-with-resourcesget-and-resourcesgetremote}

Hugo パイプでアセットを処理するには、 `resources.Get` または `resources.GetRemote` を使用して `Resource` として取得する必要があります。

`resources.Get` は、以下のように、第一引数は `assets` ディレクトリ/複数のディレクトリ からの相対的なローカルパスです。

```go-html-template
{{ $local := resources.Get "sass/main.scss" }}
```

`resources.GetRemote` は、以下のように、第一引数にリモートの URL を指定します。

```go-html-template
{{ $remote := resources.GetRemote "https://www.example.com/styles.scss" }}
```

リソースが見つからない場合、 `resources.Get` と `resources.GetRemote` は `nil` を返します。

## リソースをコピーする {#copy-a-resource}

{{< new-in "0.100.0" >}}

`resources.Copy` を使用すると、ほぼすべての Hugo `Resource` (1 つの例外は `Page`) をコピーできます。おそらく、名前を変更するときに最も役に立つでしょう。

```go-html-template
{{ $resized := $image.Resize "400x400" |  resources.Copy "images/mynewname.jpg" }}
<img src="{{ $resized.RelPermalink }}">
```

### キャッシュ化 {#caching}

デフォルトでは、Hugo は指定された `URL` と `options` (ヘッダーなど) に基づいてキャッシュキーを計算します。

{{< new-in "0.97.0" >}} オプションマップに `key` を設定することで、これをオーバーライドできます。これは、リモートリソースをフェッチする頻度をより細かく制御するために使用できます。

```go-html-template
{{ $cacheKey := print $url (now.Format "2006-01-02") }}
{{ $resource := resource.GetRemote $url (dict "key" $cacheKey) }}
```

### エラー処理 {#error-handling}

`resources.GetRemote` からの戻り値には、呼び出しが失敗した場合にエラーを返す `.Err` メソッドが含まれています。 エラーを `WARNING` としてログに記録したい場合は、以下のような構文を使用できます。

```go-html-template
{{ with resources.GetRemote "https://gohugo.io/images/gohugoio-card-1.png" }}
  {{ with .Err }}
    {{ warnf "%s" . }}
  {{ else }}
    <img src="{{ .RelPermalink }}" width="{{ .Width }}" height="{{ .Height }}" alt="">
  {{ end }}
{{ end }}
```

`.Err` を自分で処理しなかった場合、Hugo は `Resource` オブジェクトを最初に使い始めたときにビルドに失敗することに注意してください。

### リモートオプション {#remote-options}

リモート `Resource` をフェッチするとき、`resources.GetRemote` はオプションのオプションマップを最後の引数として受け取ります。たとえば、次の通りです。

```go-html-template
{{ $resource := resources.GetRemote "https://example.org/api" (dict "headers" (dict "Authorization" "Bearer abcd"))  }}
```

同じヘッダーキーに複数の値が必要な場合は、以下のようにスライスを使用します。

```go-html-template
{{ $resource := resources.GetRemote "https://example.org/api"  (dict "headers" (dict "X-List" (slice "a" "b" "c")))  }}
```

また、リクエストメソッドを変更したり、リクエストボディを設定することもできます。

```go-html-template
{{ $postResponse := resources.GetRemote "https://example.org/api"  (dict 
    "method" "post"
    "body" `{"complete": true}` 
    "headers" (dict 
        "Content-Type" "application/json"
    )
)}}
```

### リモートリソースのキャッシュ化 {#caching-of-remote-resources}

`resources.GetRemote` でフェッチしたリモートリソースは、ディスク上にキャッシュされます。詳細については、[「ファイルキャッシュの設定」](/getting-started/configuration/#configure-file-caches) を参照してください。

## アセットディレクトリ {#asset-directory}

アセットファイルはアセットディレクトリに保存する必要があります。これはデフォルトでは `/assets` ですが、設定ファイルの `assetDir` キーで設定できます。

### アセット公開 {#asset-publishing}

Hugo は、 `.Permalink`、`.RelPermalink`、または `.Publish` を実行すると、 `publishDir` (通常は `public`) にアセットを公開できます。 `.Content` を使用すると、アセットをインライン化できます。

## Go パイプ {#go-pipes}

読みやすくするために、このドキュメントの Hugoパイプの例は [Go パイプ](/templates/introduction/#pipes) を使用して記述されます。

```go-html-template
{{ $style := resources.Get "sass/main.scss" | resources.ToCSS | resources.Minify | resources.Fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
```

## メソッドのエイリアス {#method-aliases}

Hugoパイプの `resources` 変換メソッドには、それぞれ __キャメルケース__ のエイリアス (`resources.ToCSS` は `toCSS`) を使用します。
このエイリアスを持たない非変換メソッドは、 `resources.Get`、`resources.FromString`、`resources.ExecuteAsTemplate` および `resources.Concat` です。

したがって、上記の例は以下のように書くこともできます。

```go-html-template
{{ $style := resources.Get "sass/main.scss" | toCSS | minify | fingerprint }}
<link rel="stylesheet" href="{{ $style.Permalink }}">
```

## キャッシュ化 {#caching}

Hugo パイプの呼び出しは、*パイプチェーン* 全体に基づいてキャッシュされます。

パイプチェーンの例は、以下のとおりです。

```go-html-template
{{ $mainJs := resources.Get "js/main.js" | js.Build "main.js" | minify | fingerprint }}
```

パイプチェーンが呼び出されるのはサイト構築で最初に遭遇したときだけで、それ以外はキャッシュから結果が読み込まれます。そのため、Hugo パイプは何千回、何百万回と実行されるテンプレートでも、ビルドのパフォーマンスに悪影響を与えることなく使用できます。
