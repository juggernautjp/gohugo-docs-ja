---
aliases:
- /content/types
categories:
- content management
date: "2017-02-01"
description: Hugo は、セクションで構成されたコンテンツを中心に構成されています。
draft: false
keywords:
- lists
- sections
- content types
- types
- organization
menu:
  docs:
    parent: content-management
    weight: 130
title: コンテンツタイプ
toc: true
weight: 130
---

**コンテンツタイプ** とは、コンテンツを整理するための方法です。Hugo はコンテンツタイプを、フロントマターにある `type` か、設定されていない場合はファイルパスの最初のディレクトリから解決します。たとえば、 `type` が設定されていない場合、 `content/blog/my-first-event.md` は `blog` というタイプになります。

コンテンツタイプは、以下の目的で使用されます。

- コンテンツのレンダリング方法を決定します。 詳細については、[「テンプレートの検索順序」](/templates/lookup-order/) と [「コンテンツ ビュー」](https://gohugo.io/templates/views) を参照してください。
- 新しいコンテンツにどの [アーキタイプ](/content-management/archetypes/) テンプレートを使用するかを決定します。
