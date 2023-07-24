---
aliases:
- /function/numfmt/
categories:
- function
date: "2021-07-28"
description: "lang.FormatAccounting, lang.FormatCurrency, lang.FormatNumber, lang.FormatNumberCustom, lang.FormatPercent, lang.Translate 関数の説明です。"
draft: false
keywords:
- numbers
menu:
  docs:
    parent: function
# package: lang
signature:
- lang.FormatAccounting PRECISION, CURRENCY, NUMBER
- lang.FormatCurrency PRECISION, CURRENCY, NUMBER
- lang.FormatNumber PRECISION, NUMBER
- lang.FormatNumberCustom PRECISION, NUMBER, OPTIONS
- lang.FormatPercent PRECISION, NUMBER
- lang.Translate ID, ARGS
# - lang.NumFmt PRECISION NUMBER [OPTIONS [DELIMITER]]
title: lang
# type: template-func-ja
---

## lang.FormatAccounting

FormatAccounting は、現在の言語用に、指定された通貨の数値の通貨表現および精度を会計表記法で返します。

戻り値は、少なくとも小数点以下 2 桁でフォーマットされます。

#### Syntax

lang.FormatAccounting PRECISION, CURRENCY, NUMBER

#### Examples

```go-html-template
{{ 512.5032 | lang.FormatAccounting 2 "NOK" }} ---> NOK512.50
```



## lang.FormatCurrency

FormatCurrency は、現在の言語用に、指定された通貨および精度の数値の通貨表現を返します。

戻り値は、少なくとも小数点以下 2 桁でフォーマットされます。


#### Syntax

lang.FormatCurrency PRECISION, CURRENCY, NUMBER

#### Examples

```go-html-template
{{ 512.5032 | lang.FormatCurrency 2 "USD" }} ---> $512.50
```



## lang.FormatNumber

FormatNumber は、現在の言語用に、指定された精度で数値をフォーマットします。

#### Syntax

lang.FormatNumber PRECISION, NUMBER

#### Examples

```go-html-template
{{ 512.5032 | lang.FormatNumber 2 }} ---> 512.50
```



## lang.FormatNumberCustom

FormatNumberCustom は、負数、小数、およびグループ化オプションを使用して、指定された精度で数値を書式設定します。 `options` パラメータは、`<negative> <decimal> <grouping>` で構成される文字列です。 デフォルトの `options` 値は `- . ,` です。

数字は 5 以上で切り上げられることに注意してください。 したがって、精度を 0 に設定すると、1.5 は `2` になり、1.4 は `1` になります。

現在の言語については、FormatNumber を参照してください。

#### Syntax

lang.FormatNumberCustom PRECISION, NUMBER, OPTIONS

#### Examples

```go-html-template
{{ lang.FormatNumberCustom 2 12345.6789 }} ---> 12,345.68
{{ lang.FormatNumberCustom 2 12345.6789 "- , ." }} ---> 12.345,68
{{ lang.FormatNumberCustom 6 -12345.6789 "- ." }} ---> -12345.678900
{{ lang.FormatNumberCustom 0 -12345.6789 "- . ," }} ---> -12,346
{{ -98765.4321 | lang.FormatNumberCustom 2 }} ---> -98,765.43
```



## lang.FormatPercent

FormatPercent は、現在の言語用に、指定された精度で数値をフォーマットします。数値はパーセンテージであると見なされることに注意してください。

#### Syntax

lang.FormatPercent PRECISION, NUMBER

#### Examples

```go-html-template
{{ 512.5032 | lang.FormatPercent 2 }} ---> 512.50%
```



## lang.Translate

Translate は、id の翻訳された文字列を返します。

#### Syntax

lang.Translate ID, ARGS

#### Aliases

i18n, T

