INSTALLBASE = $(HOME)/.local/share/gnome-shell/extensions
INSTALLNAME = kube_config@vvbogdanov87.gmail.com
NAME = kube_config

BASE_MODULES = extension.js metadata.json LICENSE README.md
EXTRA_MODULES = kubeIndicator.js kubePopupMenuItem.js prefs.js

clean:
	rm -rf _build

install: build
	rm -rf $(INSTALLBASE)/$(INSTALLNAME)
	mkdir -p $(INSTALLBASE)/$(INSTALLNAME)
	cp -r ./_build/* $(INSTALLBASE)/$(INSTALLNAME)/

build:
	rm -rf ./_build
	mkdir _build
	cp $(BASE_MODULES) $(EXTRA_MODULES) _build
	cp -r schemas _build
	cp -r icons _build

package: build
	cd _build ; \
	zip -qr "$(NAME).zip" .
	mv _build/$(NAME).zip ./
