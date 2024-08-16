# Plaintext LaTeX Command

When reading from a formats that doesn't support raw LaTeX
snippets, the `plaintext-command` option must be enabled in order
for the `\newpage` command being recognized as a page break
marker.

``` markdown {#input}
---
pagebreak:
  break-on:
    plaintext-command: true
---

Before the page break.

\\newpage

First line on a new page.
```

Note that pandoc does not parse above as raw LaTeX due to the
double-backslash, but the `plaintext-command` option ensures that
the filter still recognizes it as a page break.

``` latex {#expected}
Before the page break.

\newpage{}

First line on a new page.
```

Note that this option comes at the cost of slightly decreased
performance.
