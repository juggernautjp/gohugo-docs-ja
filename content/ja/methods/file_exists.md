---
aliases: []
categories:
- functions
date: "2017-08-31T22:38:22+02:00"
deprecated: false
description: ファイルまたはディレクトリが存在するかどうかをチェックします。
draft: false
hugoversion: null
lastmod: "2021-11-26"
linktitle: fileExists
menu:
  docs:
    parent: functions
publishdate: "2017-08-31T22:38:22+02:00"
relatedfuncs:
- os.ReadDir
- os.ReadFile
- os.Stat
signature:
- os.FileExists PATH
- fileExists PATH
title: fileExists
workson: []
---
`os.FileExists` 関数は、プロジェクト ディレクトリのルートからの相対パスを解決しようとします。一致するファイルまたはディレクトリが見つからない場合は、 [`contentDir`]({{< relref "getting-started/configuration#contentdir">}}) からの相対パスで解決しようとします。 先頭のパス区切り文字 (`/`) は省略可能です。

以下のディレクトリ構造で

```text
content/
├── about.md
├── contact.md
└── news/
    ├── article-1.md
    └── article-2.md
```

この関数は、以下の値を返します。

```go-html-template
{{ os.FileExists "content" }} --> true
{{ os.FileExists "content/news" }} --> true
{{ os.FileExists "content/news/article-1" }} --> false
{{ os.FileExists "content/news/article-1.md" }} --> true
{{ os.FileExists "news" }} --> true
{{ os.FileExists "news/article-1" }} --> false
{{ os.FileExists "news/article-1.md" }} --> true
```
