#!/bin/sh
# Compute the next version from Conventional Commits, sync metadata, then commit and tag.
set -eu

if [ -n "$(git status --porcelain)" ]; then
  echo "Working tree is not clean." >&2
  exit 1
fi

tag="$(git-cliff --bumped-version)"
version="${tag#v}"

if git rev-parse -q --verify "refs/tags/$tag" > /dev/null; then
  echo "Nothing to release: $tag already exists." >&2
  exit 1
fi

./scripts/sync-version.sh "$version"
git add _extensions/polyu/_extension.yml
git commit -m "chore(version): $tag"
git tag "$tag"
echo "Released $tag"
