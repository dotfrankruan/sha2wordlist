#!/bin/sh
set -eu

VERSION=${VERSION:-1.0.0}
ARCH=${ARCH:-`uname -m`}
TOP=`mktemp -d`
trap 'rm -rf "$TOP"' EXIT

mkdir -p "$TOP/BUILD" "$TOP/RPMS" "$TOP/SOURCES" "$TOP/SPECS" "$TOP/SRPMS"
cp sha2wordlist "$TOP/SOURCES/sha2wordlist"

rpmbuild -bb \
	--define "_topdir $TOP" \
	--define "version $VERSION" \
	--target "$ARCH" \
	sha2wordlist.spec

cp "$TOP"/RPMS/"$ARCH"/sha2wordlist-"$VERSION"-1.*.rpm .
