---
categories:
- functions
date: "2018-09-14"
description: '`group` は、ページのリストをグループ化します。'
draft: false
hugoversion: "0.49"
keywords:
- collections
menu:
  docs:
    parent: functions
signature:
- PAGES | group KEY
title: group
---

{{< code file="layouts/partials/groups.html" >}}
{{ $new := .Site.RegularPages | first 10 | group "New" }}
{{ $old := .Site.RegularPages | last 10 | group "Old" }}
{{ $groups := slice $new $old }}
{{ range $groups }}
<h3>{{ .Key }}{{/* Prints "New", "Old" */}}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
{{< /code >}}

`group` から得られるページグループは、Hugo の組み込みの [グループメソッド](/templates/lists#group-content) から得られるものと同じタイプです。上記の例は、[ページ付け](/templates/pagination/#list-paginator-pages) することもできます。
