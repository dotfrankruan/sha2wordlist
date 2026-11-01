#!/bin/sh
set -eu

ARCH=${ARCH:-`dpkg --print-architecture`}
VERSION=${VERSION:-1.0.0}
ROOT=build/sha2wordlist

rm -rf "$ROOT"
install -d "$ROOT/usr/bin" "$ROOT/DEBIAN"
install -m 755 sha2wordlist "$ROOT/usr/bin/sha2wordlist"

sed -e "s/_ARCH_/${ARCH}/g" -e "s/_VERSION_/${VERSION}/g" \
	<sha2wordlist.control >"$ROOT/DEBIAN/control"

dpkg-deb --build --root-owner-group "$ROOT" sha2wordlist.deb
