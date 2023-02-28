---
aliases:
- /extras/datafiles/
- /extras/datadrivencontent/
- /doc/datafiles/
categories:
- templates
date: "2017-02-01"
description: Hugo の組み込み変数に加えて、ローカルとダイナミック両方のソースから取得する、テンプレートやショートコードで独自のカスタムデータを指定できます。
draft: false
keywords:
- data
- dynamic
- csv
- json
- toml
- yaml
- xml
lastmod: "2017-03-12"
linktitle: null
menu:
  docs:
    parent: templates
    weight: 80
publishdate: "2017-02-01"
sections_weight: 80
title: データテンプレート
toc: true
weight: 80
---

<!-- begin data files -->

Hugo は、Hugo プロジェクトのルートにある `data` ディレクトリにある YAML、JSON、XML、TOML ファイルからデータを読み込むことをサポートしています。

{{< youtube FyPgSuwIMWQ >}}

## データフォルダー {#the-data-folder}

`data` フォルダーは、Hugo がサイトを生成するときに使用する追加データを保存できる場所です。 データファイルは、スタンドアロン ページの生成には使用されるのではなく、むしろ、コンテンツファイルを補足するためのものです。 この機能は、フロントマター フィールドが制御不能になった場合にコンテンツを拡張できます。 あるいは、テンプレートでより大きなデータセットを表示したい場合があります (以下の例を参照してください)。 どちらの場合も、独自のファイルでデータをアウトソースすることをお勧めします。

これらのファイルは、YAML、JSON、XML、または TOML ファイル (拡張子は `.yml`、`.yaml`、`.json`、`.xml`、`.toml`) である必要があります。データは `.Site.Data` 変数内の `map` としてアクセスできます。 

`.Site.Data.filename` 表記を使用してデータにアクセスする場合、ファイル名はアンダースコアまたは Unicode 文字で始まり、その後に 0 個以上のアンダースコア、Unicode 文字、または Unicode 数字が続く必要があります。 たとえば、以下のようになります。

- `123.json` - 無効
- `x123.json` - 有効
- `_123.json` - 有効

[`index`](/functions/index-function/) 関数を使用してデータにアクセスする場合、ファイル名は関係ありません。  たとえば、以下のようになります。

データファイル | テンプレート コード
:--|:--
`123.json`|`{{ index .Site.Data "123" }}`
`x123.json`|`{{ index .Site.Data "x123" }}`
`_123.json`|`{{ index .Site.Data "_123" }}`
`x-123.json`|`{{ index .Site.Data "x-123" }}`

## テーマ内のデータファイル {#data-files-in-themes}

データファイルは [Hugo テーマ][themes] でも使用できますが、テーマのデータファイルはプロジェクト ディレクトリを優先してマージされることに注意してください (つまり、同じ名前と相対パスを持つ 2 つのファイルがあると、 *重複するキーについて*、ルートプロジェクトの `data` ディレクトリのファイルのデータが `themes/<THEME>/data` ディレクトリのファイルのデータをオーバーライドします)。

したがって、テーマの作成者は、ユーザーが [テーマをカスタマイズする][customize] と決めたときに、簡単に上書きされてしまうようなデータファイルを含まないように注意する必要があります。オーバーライドされて困るテーマ固有のデータ項目については、フォルダー構造のプレフィックスに名前空間を付けるのが賢明です。たとえば `mytheme/data/<THEME>/somekey/...` といった具合です。このような重複があるかどうかを調べるには、`-v` フラグを付けて hugo を実行します。

データファイルからデータテンプレートを使って作成したマップ内のキーは、ファイル中の `path`、`filename`、`key` のドット連結したセットになります (該当する場合)。

これは、例を挙げて説明するのが一番わかりやすいです。

## 例: Jaco Pastorius のソロ ディスコグラフィー {#example-jaco-pastorius-solo-discography}

[Jaco Pastorius](https://en.wikipedia.org/wiki/Jaco_Pastorius_discography) は素晴らしいベーシストでしたが、彼のソロディスコグラフィーは例として挙げるには短いものです。 [John Patitucci](https://en.wikipedia.org/wiki/John_Patitucci) もベースの巨人です。

以下の例は少し不自然ですが、データファイルの柔軟性を示しています。 この例では、ファイル形式として TOML を使用し、以下の 2 つのデータファイルを使用します。

* `data/jazz/bass/jacopastorius.toml`
* `data/jazz/bass/johnpatitucci.toml`

`jacopastorius.toml` には以下の内容が含まれています。 `johnpatitucci.toml` にも同様のリストが含まれています。

{{< code-toggle file="jacopastorius" >}}
discography = [
"1974 - Modern American Music … Period! The Criteria Sessions",
"1974 - Jaco",
"1976 - Jaco Pastorius",
"1981 - Word of Mouth",
"1981 - The Birthday Concert (released in 1995)",
"1982 - Twins I & II (released in 1999)",
"1983 - Invitation",
"1986 - Broadway Blues (released in 1998)",
"1986 - Honestly Solo Live (released in 1990)",
"1986 - Live In Italy (released in 1991)",
"1986 - Heavy'n Jazz (released in 1992)",
"1991 - Live In New York City, Volumes 1-7.",
"1999 - Rare Collection (compilation)",
"2003 - Punk Jazz: The Jaco Pastorius Anthology (compilation)",
"2007 - The Essential Jaco Pastorius (compilation)"
]
{{< /code-toggle >}}

ベーシストのリストは `.Site.Data.jazz.bass` でアクセスでき、単一のベーシストはファイル名をサフィックスなしで (たとえば、`.Site.Data.jazz.bass.jacopastorius`) 追加します。

以下のテンプレート内で、すべてのベーシストの録音リストをレンダリングできるようになりました。

```go-html-template
{{ range $.Site.Data.jazz.bass }}
   {{ partial "artist.html" . }}
{{ end }}
```

そして、`partials/artist.html` の中に、以下のコードがあるとします。

```go-html-template
<ul>
{{ range .discography }}
  <li>{{ . }}</li>
{{ end }}
</ul>
```

新しいお気に入りのベーシストを発見しましたか? 同じディレクトリに別の `.toml` ファイルを追加するだけです。

## 例: データファイルの名前付き値にアクセスする {#example-accessing-named-values-in-a-data-file}

`data/` に直接置かれている `User0123.[yml|toml|xml|json]` データファイルに、以下のデータ構造があると仮定します。

{{< code-toggle file="User0123" >}}
Name: User0123
"Short Description": "He is a **jolly good** fellow."
Achievements:
  - "Can create a Key, Value list from Data File"
  - "Learns Hugo"
  - "Reads documentation"
{{</ code-toggle >}}

以下のコードを使用して、レイアウトに `Short Description` をレンダリングできます。

```go-html-template
<div>Short Description of {{.Site.Data.User0123.Name}}: <p>{{ index .Site.Data.User0123 "Short Description" | markdownify }}</p></div>
```

[`markdownify` テンプレート関数][markdownify] を使用していることに注意してください。これは Markdown レンダリングエンジンを通して説明を送信します。


## リモートデータを取得する {#get-remote-data}

リモートデータを取得するには、以下のように `getJSON` または `getCSV` を使用します。

```go-html-template
{{ $dataJ := getJSON "url" }}
{{ $dataC := getCSV "separator" "url" }}
```

URL にプレフィックスまたはポストフィックスを使用した場合、関数は [可変長引数][variadic] を受け付けます。

```go-html-template
{{ $dataJ := getJSON "url prefix" "arg1" "arg2" "arg n" }}
{{ $dataC := getCSV  "separator" "url prefix" "arg1" "arg2" "arg n" }}
```

`getCSV` のセパレーターは最初の位置に配置する必要があり、1 文字の長さにする必要があります。

渡されたすべての引数は、以下のように、最終的な URL に結合されます。

```go-html-template
{{ $urlPre := "https://api.github.com" }}
{{ $gistJ := getJSON $urlPre "/users/GITHUB_USERNAME/gists" }}
```

上記は、内部的には以下のように解決されます。

```go-html-template
{{ $gistJ := getJSON "https://api.github.com/users/GITHUB_USERNAME/gists" }}
```

### HTTP ヘッダーを追加する {#add-http-headers}

`getJSON` と `getCSV` のどちらも、最後の引数としてオプションのマップを受け取ります。たとえば、以下のようになります。

```go-html-template
{{ $data := getJSON "https://example.org/api" (dict "Authorization" "Bearer abcd")  }}
```

同じヘッダーキーに複数の値が必要な場合は、以下のようにスライスを使用します。

```go-html-template
{{ $data := getJSON "https://example.org/api" (dict "X-List" (slice "a" "b" "c"))  }}
```

### CSV ファイルの例 {#example-for-csv-files}

`getCSV` の場合、最初の位置に 1 文字長のセパレーターを配置し、その後に URL を配置する必要があります。 以下は、公開された CSV から [部分テンプレート][partials] で HTML テーブルを作成する例です。

{{< code file="layouts/partials/get-csv.html" >}}
  <table>
    <thead>
      <tr>
      <th>Name</th>
      <th>Position</th>
      <th>Salary</th>
      </tr>
    </thead>
    <tbody>
    {{ $url := "https://example.com/finance/employee-salaries.csv" }}
    {{ $sep := "," }}
    {{ range $i, $r := getCSV $sep $url }}
      <tr>
        <td>{{ index $r 0 }}</td>
        <td>{{ index $r 1 }}</td>
        <td>{{ index $r 2 }}</td>
      </tr>
    {{ end }}
    </tbody>
  </table>
{{< /code >}}

現在の行から n 番目の列を出力するには、式 `{{index $r number}}` を使用する必要があります。

### キャッシュ URL {#cache-urls}

ダウンロードされた各 URL は、デフォルトフォルダー `$TMPDIR/hugo_cache/` にキャッシュされます。 変数 `$TMPDIR` は、システム依存の一時ディレクトリに解決されます。

コマンドラインフラグ `--cacheDir` を使用すると、システム上の任意のフォルダをキャッシュ ディレクトリとして指定することができます。

また、[メイン設定ファイル][config] で `cacheDir` を設定することができます。

キャッシュがまったく気に入らない場合は、コマンドラインフラグ `--ignoreCache` を使用してキャッシュを完全に無効にできます。

### REST URL 使用時の認証 {#authentication-when-using-rest-urls}

現状では、URL に入れることができる認証方法のみ使用可能です。 [OAuth][] などの認証方式は実装されていません。

## ローカルファイルをロードする {#load-local-files}

`getJSON` と `getCSV` でローカルファイルをロードするには、ソースファイルが Hugo の作業ディレクトリ内に存在する必要があります。ファイルの拡張子は関係ありませんが、コンテンツは重要です。

上記の [「リモートデータを取得する」](#get-remote-data) と同じ出力ロジックを適用します。

{{% note %}}
`getCSV` を使用してロードされるローカル CSV ファイルは、`data` ディレクトリの **外** に配置する必要があります。
{{% /note %}}

## データファイルを使用した LiveReload {#livereload-with-data-files}

URL のコンテンツが変更されたときに [LiveReload][] をトリガーする機会はありません。しかし、*ローカル* ファイル (すなわち、`data/*` と `themes/<THEME>/data/*`) が変更されると、LiveReload がトリガーされることになります。シンボリックリンクはサポートされていません。また、データのダウンロードには時間がかかるため、Hugo はデータのダウンロードが完了するまで Markdown ファイルの処理を停止することにも注意してください。

{{% warning "URL Data and LiveReload" %}}
ローカルファイルを変更して LiveReload がトリガーされると、Hugo はキャッシュからデータ駆動型 (URL) のコンテンツを読み取ります。キャッシュを無効にしている場合 (たとえば `hugo server --ignoreCache` でサーバを起動した場合)、Hugo は LiveReload がトリガーされるたびにコンテンツを再ダウンロードします。これにより、*非常に大きな* トラフィックを発生させる可能性があり、API の制限にすぐに達してしまうかもしれません。
{{% /warning %}}

## データ駆動型コンテンツの例 {#examples-of-datadriven-content}

- フォトギャラリー JSON 搭載: [https://github.com/pcdummy/hugo-lightslider-example](https://github.com/pcdummy/hugo-lightslider-example)
- [カスタムショートコード](https://github.com/SchumacherFM/blog-cs/blob/master/layouts%2Fshortcodes%2FghStarred.html) でデータ駆動型コンテンツを使用した、 [投稿における](https://github.com/SchumacherFM/blog-cs/blob/master/content%2Fposts%2Fgithub-starred.md) スター付きの GitHub リポジトリ

## データフォーマットの仕様 {#specs-for-data-formats}

* [TOML 仕様][toml]
* [YAML 仕様][yaml]
* [JSON 仕様][json]
* [CSV 仕様][csv]
* [XML 仕様][xml]

[config]: /getting-started/configuration/
[csv]: https://tools.ietf.org/html/rfc4180
[customize]: /themes/customizing/
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "JSON (JavaScript Object Notation) の仕様"
[LiveReload]: /getting-started/usage/#livereload
[lookup]: /templates/lookup-order/
[markdownify]: /functions/markdownify/
[OAuth]: https://en.wikipedia.org/wiki/OAuth
[partials]: /templates/partials/
[themes]: /themes/
[toml]: https://github.com/toml-lang/toml
[variadic]: https://en.wikipedia.org/wiki/Variadic_function
[vars]: /variables/
[yaml]: https://yaml.org/spec/
[xml]: https://www.w3.org/XML/
