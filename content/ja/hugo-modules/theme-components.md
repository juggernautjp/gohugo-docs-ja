---
aliases:
- /themes/customize/
- /themes/customizing/
categories:
- hugo modules
date: "2017-02-01"
description: Hugo は、テーマ コンポーネントによって高度なテーマ設定をサポートしています。
draft: false
keywords:
- themes
- theme
- source
- organization
- directories
linktitle: テーマ コンポーネント
menu:
  docs:
    parent: modules
    weight: 50
sections_weight: 50
title: テーマ コンポーネント
toc: true
weight: 50
---

{{% note %}}
このセクションには、古い情報が含まれている可能性があり、現在、書き換え中です。
{{% /note %}}
Hugo `0.42` 以降、プロジェクトは必要な数のテーマ コンポーネントの複合体としてテーマを構成することができます。

{{< code-toggle file="config">}}
theme = ["my-shortcodes", "base-theme", "hyde"]
{{< /code-toggle >}}

これをネストして、テーマ コンポーネント自身が自身の `config.toml` (テーマの継承) にテーマ コンポーネントを含めることもできます。[^1]

上記の `config.toml` でのテーマ定義の例では、左から右へ優先順位をつけた 3 つのテーマコンポーネントを持つテーマを作成します。

任意のファイルやデータ入力などに対して、Hugo はまずプロジェクトを探し、次に `my-shortcode` 、`base-theme`、そして最後に `hyde` を探します。

Hugo は、ファイルの種類に応じて、以下の 2 つの異なるアルゴリズムを使用してファイル システムをマージします。

* `i18n` および `data` ファイルの場合、Hugo はファイル内の翻訳 ID とデータ キーを使用して深くマージします。
* `static`、`layouts` (テンプレート)、および `archetypes` ファイルの場合、これらはファイル レベルでマージされます。 したがって、一番左のファイルが選択されます。

上記の `theme` 定義で使用する名前は `/your-site/themes` 内のフォルダーと一致しなければなりません。たとえば、 `/your-site/themes/my-shortcodes` です。これを改善し、 URL スキームを取得して、これを自動的に解決できるようにする計画があります。

また、テーマの一部であるコンポーネントは、独自の設定ファイル、たとえば `config.toml` を持つことができることに注意してください。現在、テーマ コンポーネントが設定できる内容には、いくつかの制限があります。

* `params` (global および language ごと)
* `menu` (global および language ごと)
* `outputformats` および `mediatypes`

ここでも同じルールが適用されます。つまり、同じ ID を持つ一番左の param/menu などが優先されます。 上記にはいくつかの隠れた実験的な名前空間のサポートがあり、将来的に改善する予定ですが、テーマの作成者は名前の衝突を避けるために独自の名前空間を作成することが推奨されます。

[^1]: [Hugo テーマのショーケース](https://themes.gohugo.io/) でホストされているテーマの場合、コンポーネントを git サブモジュールとして追加し、ディレクトリ `exampleSite/themes` を指すようにする必要があります。
