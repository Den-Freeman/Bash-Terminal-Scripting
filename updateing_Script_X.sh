#!/usr/bin/env bash
tempfile=$(mktemp "$BASH_SOURCE".XXXXXX)
if curl https://example.com/whatever >"$tempfile" &&
   curl https://example.com/whatever.sig >"$tempfile.sig" &&
   gpgv "$tempfile.sig" "$tempfile"; then
  chown --reference="$BASH_SOURCE" -- "$tempfile"
  chmod --reference="$BASH_SOURCE" -- "$tempfile"
  sync # force your filesystem to fully flush file contents to disk
  mv -- "$tempfile" "$BASH_SOURCE" && rm -f -- "$tempfile.sig"
else
  rm -f -- "$tempfile" "$tempfile.sig"
  exit 1
fi
