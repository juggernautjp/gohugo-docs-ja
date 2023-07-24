---
categories:
- function
date: "2017-02-01"
description: Emoji emoticons プロセッサーを介して文字列を実行します。
draft: false
keywords:
- strings
- emojis
lastmod: "2017-02-01"
menu:
  docs:
    parent: function
publishdate: "2017-02-01"
relatedfuncs: []
signature:
- "emojify INPUT"
title: emojify
---

`emojify` は渡された文字列を Emoji emoticons プロセッサーで処理します。

使用可能な絵文字 (emoticons) については、[絵文字チートシート][emojis] を参照してください。

`emojify` 関数はテンプレートで呼び出すことができますが、デフォルトではコンテンツファイルで直接呼び出すことはできません。 コンテンツファイルの絵文字については、サイトの [設定][configuration] で `enableEmoji` を `true` に設定します。すると、たとえば <code>I :</code><code>heart</code><code>: Hugo!</code>: のように、絵文字の短縮形をコンテンツファイルに直接書き込むことができます。 

I :heart: Hugo!


[configuration]: /getting-started/configuration/
[emojis]: https://www.webfx.com/tools/emoji-cheat-sheet/
[sc]: /templates/shortcode-templates/
[scsource]: https://github.com/gohugoio/hugo/tree/master/docs/layouts/shortcodes
