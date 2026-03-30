# AGENTS.md

This is a Quarto Brand extension repo.
You should refer to the following documentation for more details on how to use and customize this extension:
- https://quarto.org/docs/reference/metadata/brand.html
- https://quarto.org/docs/authoring/brand.html

## Working Principles

- Before making changes to Quarto brand, format, layout, or styling behavior, first review the relevant official Quarto documentation.
- Do not rely on memory alone for Quarto-specific implementation details when the official documentation can clarify the supported approach.
- Prefer official Quarto brand mechanisms over ad hoc template hacks.
- For HTML output, implement brand-specific presentation in `_extensions/polyu/brand.yml`.
- Prefer `defaults.bootstrap.rules` and `defaults.quarto.format.html` for HTML customization.
- Do not introduce standalone HTML include files for page chrome unless the user explicitly asks for them.
- Keep HTML customization compatible with standard `format: html` plus `brand: _extensions/polyu/brand.yml`.

## Format-Specific Guidance

- Treat `html` and `revealjs` as different rendering systems.
- Do not try to move `revealjs` styling into Bootstrap-based brand rules.
- For `revealjs`, keep format-specific styling in dedicated revealjs options or CSS files such as `_extensions/polyu/revealjs-logo.css`.
- For HTML-only fixed elements like headers, use CSS generated through brand/bootstrap rules rather than injected HTML fragments.

## Validation

- After changing brand or format behavior, render a concrete example to verify the generated output.
- Prefer validating with `example-html.qmd` for HTML changes and `example-revealjs.qmd` for revealjs changes.
- When Quarto cache or sandbox behavior causes issues, use temporary directories created by `mktemp` for cache-related environment variables.
- When running Python is necessary, prefer `uv run python`.

## Repository Conventions

- Keep the extension small and production-friendly.
- Prefer explicit Quarto defaults in `brand.yml` over adding extra extension layers when the same behavior can be achieved more simply.
- Write comments in English.
