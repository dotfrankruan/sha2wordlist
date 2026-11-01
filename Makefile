PROG=		sha2wordlist
SRCS=		sha2wordlist.c sha2.c
OBJS=		sha2wordlist.o sha2.o
VERSION?=	1.0.0
PREFIX?=	/usr/local
CC?=		cc
CFLAGS?=	-O2
CPPFLAGS?=
LDFLAGS?=
LIBS?=

IDENT_OPTS=	-v -nip

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

sha2wordlist.o: sha2wordlist.c sha2.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ sha2wordlist.c

sha2.o: sha2.c sha2.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ sha2.c

clean:
	rm -f $(PROG) $(OBJS) *.deb *.rpm
	rm -rf build

indent:
	indent $(INDENT_OPTS) < sha2wordlist.c

deb: $(PROG)
	VERSION=$(VERSION) sh deb.sh

rpm: $(PROG)
	VERSION=$(VERSION) sh rpm.sh

install: $(PROG)
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m 0755 $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)

.PHONY: all clean indent deb rpm install
