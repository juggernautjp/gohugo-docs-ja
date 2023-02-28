
.CurrentSection
: ページの現在のセクションです。 セクションまたはホームページの場合、この値はページそのものになります。

.FirstSection
: ルート以下のページの最初のセクションで、たとえば `/docs`、`/blog` などです。

.InSection $anotherPage
: 指定されたページが現在のセクションにあるかどうか。

.IsAncestor $anotherPage
: 現在のページが指定されたページの祖先であるかどうか。

.IsDescendant $anotherPage
: 現在のページが指定されたページの子孫であるかどうか。

.Parent
: セクションの親セクション、またはページのセクションです。

.Section
: このコンテンツが属する [セクション](/content-management/sections/) です。**注意:** ネストされたセクションの場合、これはディレクトリ内の最初のパス要素、たとえば、`/blog/funny/mypost/ => blog` のようになります。

.Sections
: このコンテンツの下にある [セクション](/content-management/sections/) です。
