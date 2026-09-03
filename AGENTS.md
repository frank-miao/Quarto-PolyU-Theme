# AGENTS.md

This repository packages the PolyU Quarto brand extension. It requires Quarto 1.9 or later and provides:

- `_extensions/polyu/brand.yml` for the shared PolyU brand definition;
- `polyu-html` for HTML output; and
- `polyu-revealjs` for RevealJS presentations.

Before working on Quarto content or configuration, use these skills:

- `quarto-authoring` for Quarto authoring, metadata, formats, and rendering guidance.
- `brand-yml` for the `brand.yml` schema and brand integration guidance.

If either skill is unavailable, ask the user to install the skills recorded in `skills-lock.json` with `npx skills install` or `bunx skills install` before continuing.

## Working Principles

- Before making changes to Quarto brand, format, layout, or styling behavior, first review the relevant official Quarto documentation.
- Do not rely on memory alone for Quarto-specific implementation details when the official documentation can clarify the supported approach.
- Prefer official Quarto brand mechanisms over ad hoc template hacks.
- For HTML output, implement brand-specific presentation in `_extensions/polyu/brand.yml`.
- Prefer `defaults.bootstrap.rules` and `defaults.quarto.format.html` for HTML customization.
- Do not introduce standalone HTML include files for page chrome unless the user explicitly asks for them.
- Keep HTML customization compatible with `polyu-html` and with standard `format: html` plus `brand: _extensions/polyu/brand.yml`.

## Format-Specific Guidance

- Treat `html` and `revealjs` as different rendering systems.
- Do not try to move `revealjs` styling into Bootstrap-based brand rules.
- For `polyu-revealjs`, keep format-specific styling in its extension metadata and CSS files such as `_extensions/polyu/polyu-revealjs-logo.css`.
- For HTML-only fixed elements like headers, use CSS generated through brand/bootstrap rules rather than injected HTML fragments.

## Validation

- After changing brand or format behavior, render a concrete example to verify the generated output.
- Prefer validating with `example-html.qmd` for HTML changes and `example-revealjs.qmd` for revealjs changes.
- When Quarto cache or sandbox behavior causes issues, use temporary directories created by `mktemp` for cache-related environment variables.
- When running Python is necessary, prefer `uv run python`.
- Do not modify generated render output as a source change.

## Repository Conventions

- Keep the extension small and production-friendly.
- Do not hard-wrap sentences; keep each sentence or list item on one line for Markdown and Quarto Markdown compatibility.
- Prefer explicit Quarto defaults in `brand.yml` over adding extra extension layers when the same behavior can be achieved more simply.
- Keep shared assets under `_extensions/polyu/assets/` and register new format resources in `_extensions/polyu/_extension.yml`.
- Write comments in English.

## Commits and Releases

- Follow Conventional Commits; use messages such as `feat: add a format option` or `fix: correct logo alignment`.
- The prek hooks validate TOML and YAML files before commits and run `mise x -- cog verify --file` for commit messages.
- Do not bypass a failing commit hook; correct the affected file or commit message instead.
- The extension version is stored in `_extensions/polyu/_extension.yml`.
- Prepare releases with `mise x -- cog bump --auto`; Cocogitto uses commits since the previous `vMAJOR.MINOR.PATCH` tag to determine the next version, creates the release commit and tag, and runs `scripts/sync-version.sh` to update extension metadata before the bump.
- `BREAKING CHANGE:` or a `!` marks a major release, `feat:` marks a minor release, and `fix:` marks a patch release.
