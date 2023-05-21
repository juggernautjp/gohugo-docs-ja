---
categories:
- functions
date: "2021-10-08"
description: パスのセパレーターをスラッシュ (`/`) に置き換え、不要なセパレーターを削除します。
draft: false
keywords:
- path
- clean
menu:
  docs:
    parent: functions
relatedfuncs:
- path.Base
- path.BaseName
- path.Dir
- path.Ext
- path.Join
- path.Split
signature:
- path.Clean PATH
title: path.Clean
---

`path.Clean` はパスのセパレーターをスラッシュ (`/`) に置き換え、末尾のセパレーターを含む不要なセパレーターを削除します。

```go-html-template
{{ path.Clean "foo//bar" }} → "foo/bar"
{{ path.Clean "/foo/bar/" }} → "/foo/bar"
```

Windows システムで、`.File.Path` が `foobar.md` の場合、以下のようになります。

```go-html-template
{{ path.Clean .File.Path }} → "foo/bar.md"
```
