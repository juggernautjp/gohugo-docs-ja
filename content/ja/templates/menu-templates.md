---
aliases:
- /templates/menus/
categories:
- templates
date: "2017-02-01"
description: メニューはコンテンツ管理のための強力でシンプルな機能ですが、デザインのニーズを満たすためにテンプレートで簡単に操作できます。
draft: false
keywords:
- lists
- sections
- menus
lastmod: "2017-02-01"
linktitle: メニューテンプレート
menu:
  docs:
    parent: templates
    title: テンプレートでメニューを使用する方法
    weight: 130
publishdate: "2017-02-01"
sections_weight: 130
title: メニューテンプレート
toc: false
weight: 130
---

Hugo は、レンダリングされた HTML がどのように構造化されるかについて、何も仮定しません。 代わりに、必要に応じてメニューを作成するために必要なすべての機能を提供します。

以下はその例です。

{{< code file="layouts/partials/sidebar.html" download="sidebar.html" >}}
<!-- sidebar start -->
<aside>
    <ul>
        {{ $currentPage := . }}
        {{ range .Site.Menus.main }}
            {{ if .HasChildren }}
                <li class="{{ if $currentPage.HasMenuCurrent "main" . }}active{{ end }}">
                    <a href="#">
                        {{ .Pre }}
                        <span>{{ .Name }}</span>
                    </a>
                </li>
                <ul class="sub-menu">
                    {{ range .Children }}
                        <li class="{{ if $currentPage.IsMenuCurrent "main" . }}active{{ end }}">
                            <a href="{{ .URL }}">{{ .Name }}</a>
                        </li>
                    {{ end }}
                </ul>
            {{ else }}
                <li>
                    <a href="{{ .URL }}">
                        {{ .Pre }}
                        <span>{{ .Name }}</span>
                    </a>
                </li>
            {{ end }}
        {{ end }}
        <li>
            <a href="#" target="_blank">Hardcoded Link 1</a>
        </li>
        <li>
            <a href="#" target="_blank">Hardcoded Link 2</a>
        </li>
    </ul>
</aside>
{{< /code >}}

{{% note "`absLangURL` and `relLangURL`" %}}
テーマが [多言語機能](/content-management/multilingual/) を利用している場合は、 [`absLangURL`](/functions/abslangurl) または [`relLangURL`](/functions/rellangurl) 関数を使用します。 `absURL` と `relURL` とは対照的に、この 2 つの関数は正しい言語プレフィックスを URL に追加します。
{{% /note %}}

## 怠惰なブロガーのためのセクションメニュー {#section-menu-for-lazy-bloggers}

このメニューを有効にするには、以下のように、サイトの `config` で `sectionPagesMenu` を設定します。

```yml
sectionPagesMenu = "main"
```

メニュー名は何でもかまいませんが、それが何であるかをメモしておいてください。

これにより、すべてのセクションがメニュー項目であり、すべてのセクションのページを「シャドウメンバー」とするメニューが作成されます。このメニューに表示させたい第一階層のディレクトリは、すべて [ブランチバンドル](https://gohugo.io/content-management/sections/) であることを確認してください。リーフバンドルはセクションを形成しません。

_シャドウ_ は、ページがメニュー項目自体によって表されていないことを意味しますが、これにより、以下のようなトップレベル メニューを作成できます。

```go-html-template
<nav class="sidebar-nav">
    {{ $currentPage := . }}
    {{ range .Site.Menus.main }}
    <a class="sidebar-nav-item{{if or ($currentPage.IsMenuCurrent "main" .) ($currentPage.HasMenuCurrent "main" .) }} active{{end}}" href="{{ .URL }}" title="{{ .Title }}">{{ .Name }}</a>
    {{ end }}
</nav>
```

上記では、現在のセクションのリストページまたはそのセクション内のページにある場合、メニュー項目はアクティブとしてマークされます。

## サイト設定メニュー {#site-config-menus}

必要なものは以上です。 ただし、カスタムメニュー項目が必要な場合、たとえば、重み、名前、またはリンクタイトル属性を変更したい場合は、サイト設定ファイルでこれらを手動で定義できます。

{{< code-toggle file="config" >}}
[[menu.main]]
    name = "This is the blog section"
    title = "blog section"
    weight = -110
    identifier = "blog"
    url = "/blog/"
{{</ code-toggle >}}

{{% note %}}
`identifier` は、セクション名と一致 *しなければなりません*。
{{% /note %}}

## ページのフロントマターからのメニューエントリ {#menu-entries-from-the-pages-front-matter}

また、ページ (すなわち `.md` ファイル) からメニューエントリを作成することも可能です。

以下は `yaml` の例です。

```yml
---
title: メニューテンプレート
linktitle: メニューテンプレート
menu:
  docs:
    title: "テンプレートでメニューを使用する方法"
    parent: "templates"
    weight: 130
---
...
```

{{% note %}}
メニューは複数定義することができます。また、複雑な値である必要はなく、`menu` は文字列、文字列の配列、または上記の例のような複雑な値の配列にすることもできます。
{{% /note %}}

### メニューで .Page を使用する {#using-page-in-menus}

メニューエントリを定義するフロントマター メソッドを使用すると、`.Page` 変数にアクセスできます。
これにより、[ページ変数](/variables/page/) から到達可能なすべての変数を使用できます。

この変数は、ページのフロントマターでメニューエントリが定義されている場合にのみ設定されます。
サイト設定のメニューエントリは、`.Page` について何も知りません。

そのため、テンプレート言語で go テンプレートの `with` キーワードまたは類似のものを使用する必要があります。

以下はその一例です。

```go-html-template
<nav class="sidebar-nav">
  {{ range .Site.Menus.main }}
    <a href="{{ .URL }}" title="{{ .Title }}">
      {{- .Name -}}
      {{- with .Page -}}
        <span class="date">
        {{- dateFormat " (2006-01-02)" .Date -}}
        </span>
      {{- end -}}
    </a>
  {{ end }}
</nav>
```

## メニューで .Params を使用する {#using-params-in-menus}

メニュー項目のユーザー定義コンテンツは、`.Params` を介してアクセスできます。

以下はその一例です。

```go-html-template
<nav class="sidebar-nav">
  {{ range .Site.Menus.main }}
    <a href="{{ .URL }}" title="{{ .Title }}" class="{{ with .Params.class }}{{ . }}{{ end }}">
      {{- .Name -}}
    </a>
  {{ end }}
</nav>
```

{{% note %}}
メニューレベルの .Params を使用すると、あるメニューには存在するが、別のメニューには存在しないということが簡単に起こり得ます。 [with 関数](/functions/with) を使用して適切にアクセスすることをお勧めします。
{{% /note %}}
