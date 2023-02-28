---
aliases: []
categories:
- functions
deprecated: false
description: ファイル名でソートされた FileInfo 構造体の配列を、ディレクトリ エントリごとに 1 つの要素で返します。
draft: false
hugoversion: null
keywords:
- files
lastmod: "2021-11-26"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs:
- os.FileExists
- os.ReadFile
- os.Stat
signature:
- os.ReadDir PATH
- readDir PATH
title: readDir
workson: []
---
`os.ReadDir` 関数は、プロジェクト ディレクトリのルートからの相対パスを解決します。先頭のパス区切り文字 (`/`) は省略可能です。

以下のディレクトリ構造を考えます。

```text
content/
├── about.md
├── contact.md
└── news/
    ├── article-1.md
    └── article-2.md
```

以下のテンプレート コードは、

```go-html-template
{{ range os.ReadDir "content" }}
  {{ .Name }} --> {{ .IsDir }}
{{ end }}
```

以下を生成します。

```html
about.md --> false
contact.md --> false
news --> true
```

`os.ReadDir` は、再帰的ではないことに注意してください。

`FileInfo` 構造の詳細については、[Go ドキュメント](https://pkg.go.dev/io/fs#FileInfo) を参照してください。

テンプレートで `readDir` と `readFile` を使用する方法については、[ローカルファイル テンプレート]({{< relref "/templates/files" >}}) を参照してください。
