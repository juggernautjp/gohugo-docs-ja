---
aliases:
- /layout/content/
categories:
- templates
date: "2017-02-01"
description: Hugo におけるコンテンツの主要なビューは、シングルビューです。 Hugo は提供されたすべての Markdown ファイルを、対応する単一のテンプレートでレンダリングします。
draft: false
keywords:
- page
- templates
lastmod: "2017-04-06"
linktitle: null
menu:
  docs:
    parent: templates
    weight: 60
publishdate: "2017-02-01"
sections_weight: 60
title: シングルページ テンプレート
toc: true
weight: 60
---

## シングルページ テンプレートの検索順序 {#single-page-template-lookup-order}

[テンプレートの検索順序](/templates/lookup-order/) を参照してください。

## シングルページ テンプレートの例 {#example-single-page-templates}

コンテンツページは `page` タイプであるため、テンプレートで使用できるすべての [ページ変数][pagevars] と [サイト変数][site variables] を持つことになります。

### `posts/single.html`

このシングルページ テンプレートは、Hugo の [ベーステンプレート][base templates]、日付のための [`.Format` 関数][`.Format` function]、[`.WordCount` ページ変数][`.WordCount` page variable]、そしてシングルコンテンツ特有の [タクソノミー][pagetaxonomy] を通して範囲を使用します。 また、[`with`][] は、フロントマターにタクソノミーが設定されているかどうかをチェックするために使用されます。

{{< code file="layouts/posts/single.html" download="single.html" >}}
{{ define "main" }}
<section id="main">
  <h1 id="title">{{ .Title }}</h1>
  <div>
        <article id="content">
           {{ .Content }}
        </article>
  </div>
</section>
<aside id="meta">
    <div>
    <section>
      <h4 id="date"> {{ .Date.Format "Mon Jan 2, 2006" }} </h4>
      <h5 id="wordcount"> {{ .WordCount }} Words </h5>
    </section>
    {{ with .Params.topics }}
    <ul id="topics">
      {{ range . }}
        <li><a href="{{ "topics" | absURL}}{{ . | urlize }}">{{ . }}</a> </li>
      {{ end }}
    </ul>
    {{ end }}
    {{ with .Params.tags }}
    <ul id="tags">
      {{ range . }}
        <li> <a href="{{ "tags" | absURL }}{{ . | urlize }}">{{ . }}</a> </li>
      {{ end }}
    </ul>
    {{ end }}
    </div>
    <div>
        {{ with .PrevInSection }}
          <a class="previous" href="{{.Permalink}}"> {{.Title}}</a>
        {{ end }}
        {{ with .NextInSection }}
          <a class="next" href="{{.Permalink}}"> {{.Title}}</a>
        {{ end }}
    </div>
</aside>
{{ end }}
{{< /code >}}

コンテンツタイプの新しいインスタンス (たとえば、`project/` のようなセクションの新しい `.md` ファイル) を、あらかじめ設定されたフロントマターで簡単に生成するには、[コンテンツ アーキタイプ][archetypes] を使用します。

[archetypes]: /content-management/archetypes/
[base templates]: /templates/base/
[config]: /getting-started/configuration/
[content type]: /content-management/types/
[directory structure]: /getting-started/directory-structure/
[dry]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
[`.Format` function]: /functions/format/
[front matter]: /content-management/front-matter/
[pagetaxonomy]: /templates/taxonomy-templates/#display-a-single-piece-of-contents-taxonomies
[pagevars]: /variables/page/
[partials]: /templates/partials/
[section]: /content-management/sections/
[site variables]: /variables/site/
[spf13]: https://spf13.com/
[`with`]: /functions/with/
