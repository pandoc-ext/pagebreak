# Form Feed

Form feed characters can be used in place of the `\newpage`
command if the respective option is enabled:

``` markdown {#input}
---
pagebreak:
  break-on:
    form-feed: true
---

Before the page break.



First line on a new page.
```

It becomes a `\newpage` command in LaTeX output.

``` latex {#expected}
Before the page break.

\newpage{}

First line on a new page.
```
