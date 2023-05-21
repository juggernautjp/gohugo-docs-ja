---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: ファイルのコンテンツを返します。
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
- os.ReadDir
- os.Stat
signature:
- os.ReadFile PATH
- readFile PATH
title: readFile
workson: []
---
`os.ReadFile` 関数は、プロジェクト ディレクトリのルートからの相対パスを解決しようとします。 一致するファイルが見つからない場合は、[`contentDir`]({{< relref "getting-started/configuration#contentdir">}}) からの相対パスで解決しようとします。 先頭のパス区切り文字 (`/`) は省略可能です。

プロジェクト ディレクトリのルートに README.md という名前のファイルがある場合を考えます。

```md
This is **bold** text.
```

このテンプレート コードは、

```go-html-template
{{ os.ReadFile "README.md" }}
```

以下を生成します。

```md
This is **bold** text.
```

`os.ReadFile` は、生の (未解釈の) コンテンツを返すことに注意してください。

テンプレートで `readDir` と `readFile` を使用する方法の詳細については、 [ローカルファイル テンプレート]({{< relref "/templates/files" >}}) を参照してください。
