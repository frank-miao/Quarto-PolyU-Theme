# PolyU Brand Extension for Quarto

A Quarto brand extension for The Hong Kong Polytechnic University.

This extension provides a reusable `brand.yml` with:

- PolyU-inspired brand colors
- PolyU logo assets
- Revealjs defaults for the top-right logo
- Revealjs title slide background
- Revealjs link underline styling

## Installation

```bash
quarto add frank-miao/Quarto-PolyU-Theme
```

This installs the extension under `_extensions/polyu`.

## Usage

Use the brand in your Quarto document metadata:

```yaml
---
title: "My Presentation"
brand: _extensions/polyu/brand.yml
format:
  revealjs:
    theme: default
---
```

## Revealjs Defaults

When used with `revealjs`, the extension currently applies these defaults:

- top-right wide PolyU logo
- title slide background image
- title slide background opacity
- underlined links

These defaults are defined in [`_extensions/polyu/brand.yml`](_extensions/polyu/brand.yml).

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
