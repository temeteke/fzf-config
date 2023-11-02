XDG_CONFIG_HOME ?= $(HOME)/.config
CONFIG_DIR := $(XDG_CONFIG_HOME)/fzf

.PHONY: all clean install uninstall FORCE
all: fzf fzf-tab-completion

fzf: FORCE
	git clone --depth 1 https://github.com/junegunn/fzf.git $@ 2> /dev/null || git -C $@ pull

fzf-tab-completion: FORCE
	git clone --depth 1 https://github.com/lincheney/fzf-tab-completion.git $@ 2> /dev/null || git -C $@ pull

clean:
	rm -fr fzf
	rm -fr fzf-tab-completion

install: fzf fzf-tab-completion $(CONFIG_DIR)
	fzf/install --xdg --key-bindings --no-completion --no-update-rc
	cp -a fzf-tab-completion/bash/fzf-bash-completion.sh $(CONFIG_DIR)/
	cp -a fzf-tab-completion/zsh/fzf-zsh-completion.sh $(CONFIG_DIR)/
	cp -a preview.sh $(CONFIG_DIR)/

uninstall:
	rm -fr $(CONFIG_DIR)

$(CONFIG_DIR):
	mkdir -p $@

FORCE:
