---
aliases: []
categories:
- functions
date: "2017-02-01"
deprecated: false
description: 環境変数の値を返します。環境変数が設定されていない場合は、空文字列を返します。
draft: false
hugoversion: null
keywords: []
lastmod: "2021-11-26"
menu:
  docs:
    parent: functions
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "os.Getenv VARIABLE"
- "getenv VARIABLE"
title: getenv
workson: []
---
例:

```go-html-template
{{ os.Getenv "HOME" }} --> /home/victor
{{ os.Getenv "USER" }} --> victor
```

以下のようにすると、サイトをビルドする際に値を渡すことができます。

```bash
MY_VAR1=foo MY_VAR2=bar hugo

# または

export MY_VAR1=foo
export MY_VAR2=bar
hugo
```

次に、テンプレート内の値を取得します。

```go-html-template
{{ os.Getenv "MY_VAR1" }} --> foo
{{ os.Getenv "MY_VAR2" }} --> bar
```

Hugo v0.91.0 以降では、環境変数へのアクセスを明示的に許可する必要があります。 詳細については、[Hugo のセキュリティ ポリシー](/about/security-model/#security-policy) を確認してください。 デフォルトでは、`os.Getenv` 関数を使用する場合、`HUGO_` で始まる環境変数が許可されます。

