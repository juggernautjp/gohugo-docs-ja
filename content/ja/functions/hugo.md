---
aliases: []
categories:
- functions
date: "2019-01-31"
deprecated: false
description: "`hugo` 関数を使用すると、Hugo 関連のデータに簡単にアクセスできます。"
draft: false
hugoversion: null
keywords: []
linktitle: hugo
menu:
  docs:
    parent: functions
publishdate: "2019-01-31"
relatedfuncs: []
signature:
- "hugo"
title: hugo
toc: null
workson: []
---

`hugo` は、以下の関数を含むインスタンスを返します。

hugo.Generator
: サイトを生成した Hugo のバージョンに対応する `<meta>` タグを出力します。 `hugo.Generator` は *完全な* HTML タグを出力します。 たとえば、 `<meta name="generator" content="Hugo 0.99.1" />` といった具合です。 

hugo.Version
: 使用している Hugo バイナリの現在のバージョンで、たとえば、 `0.99.1` です。

hugo.GoVersion {{< new-in "0.101.0" >}}
: Hugo バイナリがビルドされたときの Go のバージョンを返します。

hugo.Environment
: `--environment` cli タグで定義された、現在実行中の環境です。

hugo.CommitHash
: 現在の Hugo バイナリの git コミットハッシュで、たとえば、 `0e8bed9ccffba0df554728b46c5bbf6d78ae5247` です。

hugo.BuildDate
: RFC 3339 でフォーマットされた、現在の Hugo バイナリのコンパイル日で、たとえば、 `2002-10-02T10:00:05:00` です。

hugo.IsExtended {{< new-in "0.83.0" >}}
: これが拡張版の Hugo バイナリであるかどうかを返します。

hugo.IsProduction
: `hugo.Environment` が本番環境に設定されている場合、true を返します。

{{% note "Use the Hugo Generator Tag" %}}
Web サイトの `<head>` で `hugo.Generator` を使用することを強く推奨します。 `hugo.Generator` は、 [themes.gohugo.io](https://themes.gohugo.io) でホストされているすべてのテーマにデフォルトで含まれています。このジェネレーター タグによって、Hugo チームは Hugo の使用状況や人気を追跡できます。
{{% /note %}}

hugo.Deps
: [hugo.Deps](#hugodeps) を参照してください。

## hugo.Deps

{{< new-in "0.92.0" >}}

`hugo.Deps` はプロジェクトの依存関係のリスト (Hugo モジュールまたはローカルテーマ コンポーネント) を返します。

それぞれの依存関係には、以下が含まれます。

Path (string)
: このモジュールへのパスを返します。これはモジュールのパス、たとえば "github.com/gohugoio/myshortcodes" か、あるいは /theme フォルダの下のパス、たとえば "mytheme" となります。

Version (string)
: モジュールのバージョンです。

Vendor (bool)
: この依存関係がベンダリングされているかどうか。

Time (time.Time)
: 作成された時間バージョンです。

Owner
: 依存関係ツリーでは、このモジュールを依存関係として定義する最初のモジュールです。

Replace (*Dependency)
: この依存関係に置き換えられました。

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
      <td>{{ with $element.Owner }}{{.Path }}{{ end }}</td>
      <td>
        {{ $element.Path }}
        {{ with $element.Replace}}
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
