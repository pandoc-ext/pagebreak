pagebreak
=========

This filter converts paragraps containing only the LaTeX
`\newpage` or `\pagebreak` command into appropriate pagebreak
markup for other formats. The command must be the only contents
of a raw TeX block in order to be recognized. I.e., for Markdown
the following is sufficient:

    Paragraph before page break

    \newpage

    Paragraph after page break

Fully supported output formats are:

- AsciiDoc / Asciidoctor
- ConTeXt
- Docx
- EPUB
- groff ms
- Typst
- HTML
- LaTeX

ODT is supported, but requires additional settings in the
reference document (Configuration).

In all other formats, the page break is represented using the
form feed character.

Note that not all input formats support the `raw_tex` format
extension, which is required to use the filter in the default
configuration. Enable the `break-on.plaintext-command` option to
use this filter with if `raw_tex` is unavailable.

Usage
-----

The filter modifies the internal document representation; it can
be used with many publishing systems that are based on pandoc.

### Plain pandoc

Pass the filter to pandoc via the `--lua-filter` (or `-L`) command
line option.

    pandoc --lua-filter pagebreak.lua ...

### Quarto / R Markdown

The use of this filter with either Quarto or R Markdown is
*discouraged*, as both systems ship with their own fork of this
extension. Use those instead.

Note also that Quarto allows to use the [`{{ pagebreak }}`
short-code][shortcode] to insert page breaks.

[shortcode]: https://quarto.org/docs/authoring/markdown-basics.html#page-breaks

Configuration
-------------

The filter can be configured through the `pagebreak` metadata
field.

Example config in YAML frontmatter:

``` yaml
---
pagebreak:
  break-on:
    # Treat paragraphs that contain just a form feed
    # character as pagebreak markers.
    form-feed: true
    # Allow plaintext commands, i.e., respect LaTeX newpage
    # commands even if they are not in a raw TeX block.
    plaintext-command: true

  # Use a div with this class instead of hard-coded CSS
  html-class: 'page-break'

  # ODT style used for pagebreak paragraphs
  odt-style: 'Pagebreak'
---
```

Currently supported options:

- `break-on.form-feed`: boolean value indicating whether
  the filter should replace paragraphs that contains nothing but
  form feed characters with page breaks. Enabling option can have
  a significant performance impact for large documents and is
  therefore *disabled by default*.

- `break-on.plaintext-command`: boolean value that controls
  whether paragraphs with LaTeX commands should be interpreted as
  pagebreak markers. Enabling this option may impact performance,
  so it is *disabled* by default.

- `html-class`: If you want to use an HTML class rather than an
  inline style set the value of the metadata key `html-class` or
  the environment variable `PANDOC_PAGEBREAK_HTML_CLASS` (the
  metadata 'wins' if both are defined) to the name of the class
  and use CSS like this:

  ``` css
  @media all {
    .page-break	{ display: none; }
  }
  @media print {
    .page-break	{ display: block; page-break-after: always; }
  }
  ```

  Note that this will also be used for EPUB output.

- `odt-style`: To use with ODT you must create a reference ODT
  with a named paragraph style called `Pagebreak` (or whatever you
  set the metadata field `odt-style` or the environment variable
  `PANDOC_PAGEBREAK_ODT_STYLE` to) and define it as having no
  extra space before or after but set it to have a pagebreak after
  it <https://help.libreoffice.org/Writer/Text_Flow>.

  (There will be an empty placeholder paragraph, which means some
  extra vertical space, and you probably want that space to go at
  the bottom of the page before the break rather than at the top
  of the page after the break!)

Alternative syntax
------------------

The form feed character as the only element in a paragraph is
supported as an alternative to the LaTeX syntax described above.
See [Configuration](#configuration) for info on how to enable this
feature.
