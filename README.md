# PolyU Brand Extension for Quarto

A Quarto brand extension for The Hong Kong Polytechnic University.

This extension provides a reusable `brand.yml` with:

- PolyU-inspired brand colors
- PolyU logo assets
- A reusable `polyu-html` HTML format
- A reusable `polyu-revealjs` revealjs format
- HTML defaults for the fixed header layout
- Revealjs defaults for the top-right logo and title slide background

## Installation

```bash
quarto add frank-miao/Quarto-PolyU-Theme
```

This installs the extension under `_extensions/polyu`.

## Usage

Configure the extension in your project `_quarto.yml`:

```yaml
project:
  type: default
  brand: _extensions/frank-miao/polyu/brand.yml
```

Use the brand in your Quarto document metadata:

```yaml
---
title: "My Document"
format:
  polyu-html:
    toc: true
---
```

For slides:

```yaml
---
title: "My Presentation"
format:
  polyu-revealjs:
    slide-number: true
---
```

## Math Support

Both `polyu-html` and `polyu-revealjs` enable MathJax by default through `html-math-method`:

```yaml
html-math-method:
  method: mathjax
  url: https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js
```

This means inline math like `$E = mc^2$` and display math blocks work without extra setup. If needed, you can still override `html-math-method` in a document or project file.

## HTML Defaults

When used with `polyu-html`, the extension currently applies these defaults:

- fixed top header with the PolyU logo and tagline
- extra top spacing for the main content
- matching top offset for the TOC sidebar so it is not covered by the header
- implementation via the custom `polyu-html` format, without standalone HTML include files

## Revealjs Defaults

When used with `polyu-revealjs`, the extension currently applies these defaults:

- `polyu-revealjs` format entry
- top-right wide PolyU logo
- title slide background image
- title slide background opacity
- underlined links

These defaults are defined in [`_extensions/polyu/_extension.yml`](_extensions/polyu/_extension.yml).

## Example

A reusable revealjs demo is available in [`example-revealjs.qmd`](example-revealjs.qmd).

Render it with:

```bash
quarto render example-revealjs.qmd
```

## Files

- Brand definition: [`_extensions/polyu/brand.yml`](_extensions/polyu/brand.yml)
- Extension metadata: [`_extensions/polyu/_extension.yml`](_extensions/polyu/_extension.yml)
- Revealjs CSS overrides: [`_extensions/polyu/revealjs-logo.css`](_extensions/polyu/revealjs-logo.css)
