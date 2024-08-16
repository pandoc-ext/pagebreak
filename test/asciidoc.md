## Asciidoc

``` markdown {#input}
Before the page break.

\newpage

First line on a new page.
```

Asciidoc uses three *smaller-than* characters to mark a page
break.

``` asciidoc {#expected format="asciidoc"}
Before the page break.

<<<

First line on a new page.

```
