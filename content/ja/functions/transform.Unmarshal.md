---
aliases: []
categories:
- functions
date: "2018-12-23"
description: '`transform.Unmarshal` (別名 `unmarshal`) は入力をパースして、マップまたは配列に変換します。 サポートされている形式は、 JSON、TOML、YAML、XML、CSV です。'
draft: false
hugoversion: "0.53"
keywords: []
menu:
  docs:
    parent: functions
signature:
- RESOURCE or STRING | transform.Unmarshal [OPTIONS]
title: transform.Unmarshal
---

この関数は、[Hugo パイプ](/hugo-pipes/) または [ページバンドル](/content-management/page-bundles/) を介して作成された `Resource`、または単に文字列を受け入れます。 以下の 2 つの例では、同じマップが生成されます。

```go-html-template
{{ $greetings := "hello = \"Hello Hugo\"" | transform.Unmarshal }}`
```

```go-html-template
{{ $greetings := "hello = \"Hello Hugo\"" | resources.FromString "data/greetings.toml" | transform.Unmarshal }}
```

上記の両方の例で、操作できるマップが得られます。

```go-html-template
{{ $greetings.hello }}
```

上記は、 `Hello Hugo` を出力します。

## CSV オプション {#csv-options}

CSV を入力とする Unmarshal では、以下のような、いくつかのオプションを設定できます。

delimiter
: 使用される区切り文字で、デフォルトは `,` です。

comment
: CSV で使用されるコメント文字です。 設定されている場合、前に空白がないコメント文字で始まる行は無視されます。

例:

```go-html-template
{{ $csv := "a;b;c" | transform.Unmarshal (dict "delimiter" ";") }}
```

## XML データ {#xml-data}

便宜上、Hugo を使用すると、JSON、TOML、および YAML にアクセスするのと同じ方法で XML データにアクセスできます。データにアクセスするときにルートノードを指定する必要はありません。

以下のドキュメントの `<title>` のコンテンツを取得するには、`{{ .message.title }}` を使用します。

```xml
<root>
    <message>
        <title>Hugo rocks!</title>
        <description>Thanks for using Hugo</description>
    </message>
</root>
```

次の例は、RSS フィードの項目を一覧表示します。

```go-html-template
{{ with resources.Get "https://example.com/rss.xml" | transform.Unmarshal }}
    {{ range .channel.item }}
        <strong>{{ .title | plainify | htmlUnescape }}</strong><br />
        <p>{{ .description | plainify | htmlUnescape }}</p>
        {{ $link := .link | plainify | htmlUnescape }}
        <a href="{{ $link }}">{{ $link }}</a><br />
        <hr>
    {{ end }}
{{ end }}
```
