PREFIX=/usr/local

install:
	install -Dm755 specfetch $(PREFIX)/bin/specfetch

uninstall:
	rm -f $(PREFIX)/bin/specfetch
