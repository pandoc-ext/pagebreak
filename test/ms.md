## MS

``` markdown {#input}
Before the page break.

\newpage

First line on a new page.
```

A page break is simply the `.bp` macro in MS:

``` ms {#expected}
.LP
Before the page break.
.bp
.PP
First line on a new page.
```
