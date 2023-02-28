---
aliases:
- /variables/file-variables/
categories:
- variables and params
date: "2017-02-01"
description: "`.File` 変数で、コンテンツファイルのファイルシステム関連データにアクセスできます。"
draft: false
keywords:
- files
lastmod: "2017-02-01"
linktitle: null
menu:
  docs:
    parent: variables
    weight: 40
publishdate: "2017-02-01"
sections_weight: 40
title: ファイル変数
toc: false
weight: 40
---

{{% note "Rendering Local Files" %}}
Hugo のファイル関連機能セットを利用するショートコードとテンプレートの作成については、[ローカルファイル テンプレート](/templates/files/) を参照してください。 
{{% /note %}}

`.File` オブジェクトは、以下のフィールドを含みます。

.File.Path
: ページのオリジナルの相対パスで、コンテンツディレクトリからの相対パスです (たとえば、`posts/foo.en.md`)。

.File.LogicalName
: ページを表すコンテンツファイルの名前です (たとえば、`foo.en.md`)。

.File.TranslationBaseName
: 拡張子またはオプションの言語識別子を除いたファイル名です (たとえば、 `foo`)。

.File.ContentBaseName
: TranslationBaseName、または、ファイルがリーフバンドルの場合は、格納フォルダーの名前です。

.File.BaseFileName
: 拡張子を除いたファイル名です (たとえば、 `foo.en`)。

.File.Ext
: コンテンツ ファイルのファイル拡張子です (たとえば、 `md`)。

.File.Lang
: Hugo の [多言語機能][multilingual] が有効な場合、指定されたファイルに関連付けられている言語 (たとえば、 `en`) を指定します。

.File.Dir
: パス `content/posts/dir1/dir2/` を指定すると、コンテンツファイルの相対ディレクトリパスが返されます (たとえば、 `posts/dir1/dir2/`)。 パス区切り文字 (`\` または `/`) は、OS に依存する可能性があることに注意してください。

.File.UniqueID
: コンテンツファイルのパスの MD5 チェックサムです。

[Multilingual]: /content-management/multilingual/
