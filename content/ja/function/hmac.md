---
aliases: []
categories:
- functions
date: "2020-05-29"
deprecated: false
description: 鍵を使ってメッセージに署名するための暗号化ハッシュを返します。
draft: false
hugoversion: null
keywords:
- hmac
- checksum
lastmod: "2020-05-29"
linktitle: hmac
menu:
  docs:
    parent: functions
publishdate: "2020-05-29"
relatedfuncs:
- hmac
signature:
- crypto.HMAC HASH_TYPE KEY MESSAGE [ENCODING]
- hmac HASH_TYPE KEY MESSAGE [ENCODING]
title: hmac
workson: []
---

`HASH_TYPE` 引数に `md5`、`sha1`、`sha256`、または `sha512` を設定します。

オプションの `ENCODING` 引数に、 `hex` (デフォルト) または `binary` を設定します。

```go-html-template
{{ hmac "sha256" "Secret key" "Secret message" }}
5cceb491f45f8b154e20f3b0a30ed3a6ff3027d373f85c78ffe8983180b03c84

{{ hmac "sha256" "Secret key" "Secret message" "hex" }}
5cceb491f45f8b154e20f3b0a30ed3a6ff3027d373f85c78ffe8983180b03c84

{{ hmac "sha256" "Secret key" "Secret message" "binary" | base64Encode }}
XM60kfRfixVOIPOwow7Tpv8wJ9Nz+Fx4/+iYMYCwPIQ=
```
