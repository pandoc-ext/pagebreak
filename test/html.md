## HTML

``` markdown {#input}
Before the page break.

\newpage

First line on a new page.
```

Asciidoc uses three *smaller-than* characters to mark a page
break.

``` html {#expected}
<p>Before the page break.</p>
<div style="page-break-after: always;"></div>
<p>First line on a new page.</p>
```
