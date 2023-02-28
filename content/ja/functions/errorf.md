---
categories:
- functions
date: "2017-09-30"
deprecated: false
description: テンプレートから ERROR または WARNING をログに記録します。
draft: false
hugoversion: null
keywords:
- strings
- log
- error
lastmod: "2017-09-30"
menu:
  docs:
    parent: functions
publishdate: "2017-09-30"
relatedfuncs:
- printf
signature:
- "errorf FORMAT INPUT"
title: errorf と warnf
workson: []
---

`errorf` または `warnf` はフォーマット文字列を評価し、その結果を ERROR または WARNING ログに出力します (ログがあふれないように、エラーメッセージごとに一度だけ出力されます)。

ERROR が発生すると、ビルドも失敗します (`hugo` コマンドは、 `exit -1` を実行します)。

どちらの関数も空文字列を返すので、メッセージはコンソールにのみ出力されます。

```go-html-template
{{ errorf "Failed to handle page %q" .Path }}
```

```go-html-template
{{ warnf "You should update the shortcodes in %q" .Path }}
```

なお、 `errorf`、`erroridf`、`warnf` は、 [fmt](https://pkg.go.dev/fmt) パッケージのすべてのフォーマット動詞をサポートしていることに注意してください。

## エラーを抑制する {#suppress-errors}

場合によっては、ユーザーが ERROR を抑制してビルドを成功させることが理にかなっている場合があります。

これを行うには、 `erroridf` 関数を使用します。この関数は第 1 引数としてエラー ID を受け取ります。

```go-html-template
{{ erroridf "my-custom-error" "You should consider fixing this." }}
```  

上記のコードにより、以下のメッセージが生成されます。

```
ERROR 2021/06/07 17:47:38 You should consider fixing this.
If you feel that this should not be logged as an ERROR, you can ignore it by adding this to your site config:
ignoreErrors = ["my-custom-error"]
```
