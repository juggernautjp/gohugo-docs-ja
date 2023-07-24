---
categories:
- function
date: "2019-01-31"
description: "`hugo` 関数を使用すると、Hugo 関連のデータに簡単にアクセスできます。"
draft: false
keywords: []
linktitle: hugo
menu:
  docs:
    parent: function
publishdate: "2019-01-31"
relatedfuncs: []
signature:
- "hugo"
title: hugo
toc: null
---

`hugo` は、以下の関数を含むインスタンスを返します。

`hugo.BuildDate`
: (`string`) [RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339) でフォーマットされた、現在の Hugo バイナリのコンパイル日で、たとえば、 `2023-05-23T08:14:20Z` です。

`hugo.CommitHash`
: (`string`) 現在の Hugo バイナリの git コミットハッシュで、たとえば、 `0e8bed9ccffba0df554728b46c5bbf6d78ae5247` です。

`hugo.Deps`
: (`[]*hugo.Dependency`) [hugo.Deps](#hugodeps) を参照してください。

`hugo.Environment`
: (`string`) `--environment` CLI フラグで定義された現在の実行環境で、たとえば、`development`、`production` です。

`hugo.Generator`
: (`template.HTML`) サイトを生成した Hugo のバージョンに対応する `<meta>` タグを出力します。 `hugo.Generator` は *完全な* HTML タグを出力します。 たとえば、 `<meta name="generator" content="Hugo 0.112.0" />` といった具合です。 

`hugo.GoVersion`
: (`string`) Hugo バイナリがビルドされたときの Go のバージョンで。たとえば、`go1.20.4` を返します。 {{< new-in "0.101.0" >}}

`hugo.IsExtended`
: (`bool`) これが拡張版の Hugo バイナリであるかどうかを返します。

`hugo.IsProduction`
: (`bool`) `hugo.Environment` が本番環境に設定されている場合、true を返します。

`hugo.Version`
: (`hugo.VersionString`) 使用している Hugo バイナリの現在のバージョンで、たとえば、 `0.112.1` です。

`hugo.WorkingDir`
: (`string`) プロジェクトの作業ディレクトリで、たとえば、 `/home/user/projects/my-hugo-site` を返します。 {{< new-in "0.112.0" >}}

## hugo.Deps

{{< new-in "0.92.0" >}}

`hugo.Deps` はプロジェクトの依存関係のリスト (Hugo モジュールまたはローカルテーマ コンポーネント) を返します。

それぞれの依存関係には、以下が含まれます。

Owner
: (`*hugo.Dependency`) 依存関係ツリーでは、このモジュールを依存関係として定義する最初のモジュールです。(例えば、`github.com/gohugoio/hugo-mod-bootstrap-scss/v5`)。

Path
: (`string`) モジュールパス、または `themes` ディレクトリ以下のパス (たとえば、 `github.com/gohugoio/hugo-mod-jslibs-dist/popperjs/v2`) を返します。

Replace
: (`*hugo.Dependency`) この依存関係に置き換えられました。

Time
: (`time.Time`) バージョンが作成された時刻で、たとえば、`2022-02-13 15:11:28 +0000 UTC` です。

Vendor
: (`bool`) 依存関係がベンダーされている場合に、 `true` を返します。

Version
: (`string`) モジュールのバージョンで、たとえば、`v2.21100.20000` です。

以下は、依存関係をリストした表の例です。

```html
<h2>Dependencies</h2>
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Owner</th>
      <th scope="col">Path</th>
      <th scope="col">Version</th>
      <th scope="col">Time</th>
      <th scope="col">Vendor</th>
    </tr>
  </thead>
  <tbody>
    {{ range $index, $element := hugo.Deps }}
    <tr>
      <th scope="row">{{ add $index 1 }}</th>
      <td>{{ with $element.Owner }}{{ .Path }}{{ end }}</td>
      <td>
        {{ $element.Path }}
        {{ with $element.Replace }}
        => {{ .Path }}
        {{ end }}
      </td>
      <td>{{ $element.Version }}</td>
      <td>{{ with $element.Time }}{{ . }}{{ end }}</td>
      <td>{{ $element.Vendor }}</td>
    </tr>
    {{ end }}
  </tbody>
</table>
```
