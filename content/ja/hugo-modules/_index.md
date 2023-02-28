---
aliases:
- /themes/overview/
- /themes/
categories:
- hugo modules
date: "2017-02-01"
description: Hugo モジュールの使用方法について。
draft: false
keywords:
- themes
- modules
linktitle: Hugo モジュールの概要
menu:
  docs:
    parent: modules
    weight: 01
publishdate: "2017-02-01"
sections_weight: 01
title: Hugo モジュール
toc: true
weight: 01
---

**Hugo モジュール** は Hugo の中核となる構成要素です。モジュール (_module_) はメインプロジェクトにすることも、、Hugo で定義されている 7 つのコンポーネントタイプのうち1つ以上を提供する小さなモジュールにすることもできます。 7 つのコンポーネントタイプとは、**static**、**content**、**layouts**、**data**、**assets**、**i18n**、**archetypes** です。

モジュールを自由に組み合わせることができ、Hugo 以外のプロジェクトのディレクトリをマウントして、大きな仮想ユニオン ファイルシステムを形成することも可能です。

Hugo モジュールは、Go モジュールによって提供されています。Go モジュールの詳細については、以下を参照してください。

- [https://github.com/golang/go/wiki/Modules](https://github.com/golang/go/wiki/Modules)
- [https://go.dev/blog/using-go-modules](https://go.dev/blog/using-go-modules)

これはすべて非常に新しいもので、プロジェクト例も数えるほどしかありません。

- [https://github.com/bep/docuapi](https://github.com/bep/docuapi) は、この機能のテスト中に Hugo モジュールに移植されたテーマです。これは、非 Hugo プロジェクトが Hugo のフォルダー構造にマウントされている良い例です。通常の Go テンプレートで JS Bundler の実装も示しています。
- [https://github.com/bep/my-modular-site](https://github.com/bep/my-modular-site) は、テストに使われる非常にシンプルなサイトです。
