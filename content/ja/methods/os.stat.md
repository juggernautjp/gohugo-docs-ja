---
aliases: []
categories:
- functions
date: "2018-08-07"
deprecated: false
description: ファイルまたはディレクトリを記述する FileInfo 構造体を返します。
draft: false
hugoversion: null
keywords:
- files
lastmod: "2021-11-26"
menu:
  docs:
    parent: functions
publishdate: "2018-08-07"
relatedfuncs:
- os.FileExists
- os.ReadDir
- os.ReadFile
signature:
- os.Stat PATH
title: os.Stat
workson: []
---
`o.Stat` 関数は、プロジェクト ディレクトリのルートからの相対パスを解決しようとします。 一致するファイルまたはディレクトリが見つからない場合は、[`contentDir`]({{< relref "getting-started/configuration#contentdir">}}) からの相対パスで解決しようとします。 先頭のパス区切り文字 (`/`) は省略可能です。

```go-html-template
{{ $f := os.Stat "README.md" }}
{{ $f.IsDir }}    --> false (bool)
{{ $f.ModTime }}  --> 2021-11-25 10:06:49.315429236 -0800 PST (time.Time)
{{ $f.Name }}     --> README.md (string)
{{ $f.Size }}     --> 241 (int64)

{{ $d := os.Stat "content" }}
{{ $d.IsDir }}    --> true (bool)
```

`FileInfo` 構造の詳細については、[Go ドキュメント](https://pkg.go.dev/io/fs#FileInfo) を参照してください。
