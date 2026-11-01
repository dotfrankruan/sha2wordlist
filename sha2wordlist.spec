Name:		sha2wordlist
Version:	%{version}
Release:	1%{?dist}
Summary:	SHA-2 Wordlist Generator
License:	BSD-2-Clause
URL:		https://github.com/dotfrankruan/sha2wordlist
Source0:	sha2wordlist
BuildArch:	%{_target_cpu}

%global debug_package %{nil}
%global __os_install_post %{nil}

%description
sha2wordlist digests standard input and displays the SHA-2 checksum
as PGP words.

%prep

%build

%install
install -D -m 755 %{_sourcedir}/sha2wordlist %{buildroot}%{_bindir}/sha2wordlist

%files
%{_bindir}/sha2wordlist

%changelog
* Sun Nov 01 2026 Frank Ruan <admin@frank-ruan.com> - %{version}-1
- Initial package
