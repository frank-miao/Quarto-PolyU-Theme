#!/bin/sh

set -eu

version="$1"
version_file="_extensions/polyu/_extension.yml"
temporary_file="$(mktemp "${TMPDIR:-/tmp}/polyu-version.XXXXXX")"

cleanup() {
  rm -f "$temporary_file"
}

trap cleanup 0 HUP INT TERM

awk -v version="$version" '
  /^version: / {
    print "version: " version
    found = 1
    next
  }
  { print }
  END {
    if (!found) {
      exit 1
    }
  }
' "$version_file" > "$temporary_file"

mv "$temporary_file" "$version_file"
