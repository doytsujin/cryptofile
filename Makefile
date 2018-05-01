ifeq ($(CC), )
	CC := gcc
endif

.PHONY: all install clean

PREFIX ?= /usr/local

default_target: all

all: cryptofile.c tiny-AES-c/aes.c tiny-AES-c/aes.h random.c random.h
	$(CC) cryptofile.c tiny-AES-c/aes.c random.c -o cryptofile

install: all
	cp cryptofile $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/cryptofile

clean:
	rm -rf cryptofile