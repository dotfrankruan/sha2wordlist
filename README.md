# sha2wordlist

_sha2wordlist_ digests STDIN and outputs a SHA-2 checksum displayed as [PGP words](https://en.wikipedia.org/wiki/PGP_Words).

## Usage

```
sha2wordlist [-a sha256|sha384|sha512]
```

The algorithm defaults to `sha256`.

## Example Output

```
$ echo -n "hello" | sha2wordlist
SHA-256:    2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
PGP Words:  Burbank vagabond dreadful puberty eyetooth phonetic reform Atlantic bookshelf typewriter clockwork chambermaid solo proximate tiger onlooker beeswax bodyguard berserk fascinate billiard paragraph crowfoot finicky hockey alkali chisel gadgetry playhouse Medusa printer Capricorn
```

The same input with `-a sha384` or `-a sha512` produces a longer checksum and word list.

## Building

```
make                    # native binary
make deb                # Debian package
make rpm                # RPM package
make install            # install under /usr/local (PREFIX=/usr/local)
```

Cross-compiling a static Linux binary:

```
make clean
make CC=aarch64-linux-gnu-gcc LDFLAGS=-static
```

The GitHub Actions workflow builds:

- static ELF binaries for Linux `x86_64` and `aarch64`
- `.deb` and `.rpm` packages for both architectures
- a universal Darwin binary (`arm64` + `x86_64`)

Linux-to-macOS cross-compilation needs the Apple SDK, so the Darwin binary is
built on a macOS runner, cross-compiling `x86_64` from the arm64 host.

Pushing to `main` automatically updates the **Latest build** prerelease on the
GitHub Releases page. Pushing a `v*` tag creates a versioned release instead.
