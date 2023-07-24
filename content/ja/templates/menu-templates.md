---
aliases:
- /templates/menus/
categories:
- templates
date: "2017-02-01"
description: メニューをレンダリングするには、テンプレートでメニュー変数とメソッドを使用します。
draft: false
keywords:
- lists
- sections
- menus
lastmod: "2017-02-01"
menu:
  docs:
    parent: templates
    title: テンプレートでメニューを使用する方法
    weight: 130
publishdate: "2017-02-01"
sections_weight: 140
title: メニューテンプレート
toc: false
weight: 140
---

## 概要 {#overview}

[メニュー エントリの定義][defining menu entries] の後、[メニュー変数とメソッド][menu variables and methods] を使用してメニューをレンダリングします。

メニューのレンダリング方法を決定する 3 つの要素は、以下です。

1. メニューエントリの定義に使用される方法: [自動][automatic]、[フロントマター内][in front matter]、または [サイト設定内][in site configuration] 
2. メニュー構造: フラットまたはネスト
3. [メニュー エントリのローカライズ][localize the menu entries] に使用される方法: サイト構成または翻訳テーブル

以下の例では、あらゆる組み合わせを処理します。

## 例 {#example}

この部分テンプレート (パーシャル) はメニュー構造を再帰的に「ウォーク」し、ローカライズされたアクセス可能なネストされたリストをレンダリングする。

{{< code file="layouts/partials/menu.html" >}}
{{- $page := .page }}
{{- $menuID := .menuID }}

{{- with index site.Menus $menuID }}
  <nav>
    <ul>
      {{- partial "inline/menu/walk.html" (dict "page" $page "menuEntries" .) }}
    </ul>
  </nav>
{{- end }}

{{- define "partials/inline/menu/walk.html" }}
  {{- $page := .page }}
  {{- range .menuEntries }}
    {{- $attrs := dict "href" .URL }}
    {{- if $page.IsMenuCurrent .Menu . }}
      {{- $attrs = merge $attrs (dict "class" "active" "aria-current" "page") }}
    {{- else if $page.HasMenuCurrent .Menu .}}
      {{- $attrs = merge $attrs (dict "class" "ancestor" "aria-current" "true") }}
    {{- end }}
    <li>
      <a
        {{- range $k, $v := $attrs }}
          {{- with $v }}
            {{- printf " %s=%q" $k $v | safeHTMLAttr }}
          {{- end }}
        {{- end -}}
      >{{ or (T .Identifier) .Name | safeHTML }}</a>
      {{- with .Children }}
        <ul>
          {{- partial "inline/menu/walk.html" (dict "page" $page "menuEntries" .) }}
        </ul>
      {{- end }}
    </li>
  {{- end }}
{{- end }}
{{< /code >}}

Call the partial above, passing a menu ID and the current page in context.

{{< code file="layouts/_default/single.html" >}}
{{ partial "menu.html" (dict "menuID" "main" "page" .) }}
{{ partial "menu.html" (dict "menuID" "footer" "page" .) }}
{{< /code >}}

## ページ参照 {#page-references}

[メニュー エントリを定義する][define menu entries] 方法に関係なく、ページに関連付けられたエントリはページ変数とメソッドにアクセスできます。

この単純な例では、各エントリの `name` の隣に `version` という名前のページ パラメータが表示されます。
(a) エントリが外部リソースを指している場合、または (b) `version` パラメータが定義されていない場合、`with` または `if` を使用して防御的にエントリを処理するコードを作成します。

{{< code file="layouts/_default/single.html" >}}
{{- range site.Menus.main }}
  <a href="{{ .URL }}">
    {{ .Name }}
    {{- with .Page }}
      {{- with .Params.version -}}
        ({{ . }})
      {{- end }}
    {{- end }}
  </a>
{{- end }}
{{< /code >}}

## メニューエントリ パラメータ {#menu-entry-parameters}

メニューエントリーを [サイト構成][in site configuration] または [フロントマター][in front matter] で定義するとき、以下の例に示すように `params` キーを含めることができます。

- [サイト構成で定義されたメニューエントリ][Menu entry defined in site configuration]
- [フロントマターで定義されたメニューエントリ][Menu entry defined in front matter]

この単純化した例では、各アンカー要素に `class` 属性をレンダリングします。 `with` または `if` を使用して、`params.class` が定義されていないエントリを処理します。

{{< code file="layouts/partials/menu.html" >}}
{{- range site.Menus.main }}
  <a {{ with .Params.class -}} class="{{ . }}" {{ end -}} href="{{ .URL }}">
    {{ .Name }}
  </a>
{{- end }}
{{< /code >}}

## ローカライズする {#localize}

Hugo は、メニュー項目をローカライズするために2つの方法を提供します。 [多国語化][multilingual] を参照してください。

[automatic]: /content-management/menus/#define-automatically
[define menu entries]: /content-management/menus/
[defining menu entries]: /content-management/menus/
[in front matter]: /content-management/menus/#define-in-front-matter
[in site configuration]: /content-management/menus/#define-in-site-configuration
[localize the menu entries]: /content-management/multilingual/#menus
[menu entry defined in front matter]: /content-management/menus/#example-front-matter
[menu entry defined in site configuration]: /content-management/menus/#example-site-configuration
[menu variables and methods]: /variables/menus/
[multilingual]: /content-management/multilingual/#menus
