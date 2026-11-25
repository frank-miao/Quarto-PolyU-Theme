# Contributing

## Development Hooks and Releases

This repository uses [hk](https://hk.jdx.dev/) to enforce [Conventional Commits](https://www.conventionalcommits.org/) at commit time. The tools are managed with [mise](https://mise.jdx.dev/). Install the hooks once after cloning:

```bash
mise x -- hk install
```

Use conventional commit messages such as `fix: correct logo alignment` or `feat: add a new HTML option`. The `commit-msg` hook rejects invalid messages.

The extension version is stored in [`_extensions/polyu/_extension.yml`](_extensions/polyu/_extension.yml). When preparing a release, run:

```bash
mise x -- ./scripts/release.sh
```

The script uses git-cliff to inspect commits since the previous `vMAJOR.MINOR.PATCH` tag, synchronizes the extension metadata, then creates a release commit and tag. Its rules are: `BREAKING CHANGE:` or `!` increments major, `feat:` increments minor, and `fix:` increments patch. For the initial `1.0.0` baseline, create the `v1.0.0` tag once before releasing.
