---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 指定された文字列を安全な URL または URL 部分文字列として宣言します。
draft: false
hugoversion: null
keywords:
- strings
- urls
lastmod: "2017-02-01"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- safeURL INPUT
title: safeURL
workson: []
---

`safeURL` は指定された文字列を「安全な」 URL または URL の部分文字列として宣言します ([RFC 3986][] を参照してください)。信頼できるソースからの `javascript:checkThatFormNotEditedBeforeLeavingPage()` のような URL はページに入れるべきですが、動的な `javascript:` URL は頻繁に悪用されるインジェクション ベクトルであるため、デフォルトでフィルタリングされて除外されます。

`safeURL` がない場合、Go テンプレートでは `http:`、`https:`、`mailto:` という URI スキームのみが安全であるとみなされます。 その他の URI スキーム (たとえば、 `irc:` や `javascript:`) が検出された場合、URL 全体が `#ZgotmplZ` に置き換えられます。 これは、それを置換して無効なコードにレンダリングすることによって、URL の潜在的な攻撃を「無害化」するためです。

以下の例では、[サイトの `config.toml`][configuration] に以下のような [メニューエントリ][menus] を設定しています。

{{< code file="config.toml" copy="false" >}}
[[menu.main]]
    name = "IRC: #golang at freenode"
    url = "irc://irc.freenode.net/#golang"
{{< /code >}}

以下は、前述のフロントマターの例と組み合わせて使用することができる、サイドバーの部分テンプレート (パーシャル) の例です。

{{< code file="layouts/partials/bad-url-sidebar-menu.html" copy="false" >}}
<!-- この順序付けられていないリストは、サイドバー メニューの一部である可能性があります -->
<ul>
  {{ range .Site.Menus.main }}
  <li><a href="{{ .URL }}">{{ .Name }}</a></li>
  {{ end }}
</ul>
{{< /code >}}

この部分テンプレートは、以下の HTML を出力します。

{{< output file="bad-url-sidebar-menu-output.html" >}}
<!-- この順序付けられていないリストは、サイドバー メニューの一部である可能性があります -->
<ul>
    <li><a href="#ZgotmplZ">IRC: #golang at freenode</a></li>
</ul>
{{< /output >}}

上記の奇妙な出力は、以下のように、ページ変数 `.URL` に ` | safeURL` を追加することで改善できます。

{{< code file="layouts/partials/correct-url-sidebar-menu.html" copy="false" >}}
<!-- この順序付けられていないリストは、サイドバー メニューの一部である可能性があります -->
<ul>
    <li><a href="{{ .URL | safeURL }}">{{ .Name }}</a></li>
</ul>
{{< /code >}}

`.URL` ページ変数が `safeURL` を通してパイプされることで、目的の出力が得られます。

{{< output file="correct-url-sidebar-menu-output.html" >}}
<ul class="sidebar-menu">
    <li><a href="irc://irc.freenode.net/#golang">IRC: #golang at freenode</a></li>
</ul>
{{< /output >}}

[configuration]: /getting-started/configuration/
[menus]: /content-management/menus/
[RFC 3986]: https://tools.ietf.org/html/rfc3986
