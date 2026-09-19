XDG_CONFIG_HOME ?= $(HOME)/.config
CONFIG_DIR := $(XDG_CONFIG_HOME)/fzf

.PHONY: all clean install install-config install-bin uninstall uninstall-config uninstall-bin FORCE
all: fzf fzf-tab-completion

fzf: FORCE
	git clone --depth 1 https://github.com/junegunn/fzf.git $@ 2> /dev/null || git -C $@ pull

fzf-tab-completion: FORCE
	git clone --depth 1 https://github.com/lincheney/fzf-tab-completion.git $@ 2> /dev/null || git -C $@ pull

clean:
	rm -fr fzf
	rm -fr fzf-tab-completion

install:
	$(MAKE) install-bin
	$(MAKE) install-config

install-bin: fzf
	fzf/install --bin

install-config: fzf fzf-tab-completion $(CONFIG_DIR)
	fzf/install --xdg --key-bindings --completion --no-update-rc
	cp -a fzf-tab-completion/bash/fzf-bash-completion.sh $(CONFIG_DIR)/
	cp -a fzf-tab-completion/zsh/fzf-zsh-completion.sh $(CONFIG_DIR)/
	cp -a preview.sh $(CONFIG_DIR)/

uninstall:
	$(MAKE) uninstall-config
	$(MAKE) uninstall-bin

uninstall-config:
	rm -fr $(CONFIG_DIR)

uninstall-bin:
	rm -f fzf/bin/fzf

$(CONFIG_DIR):
	mkdir -p $@

FORCE:
