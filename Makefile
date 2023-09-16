.PHONY: all clean install uninstall FORCE
all: fzf fzf-tab-completion

fzf: FORCE
	git clone --depth 1 https://github.com/junegunn/fzf.git $@ 2> /dev/null || git -C $@ pull

fzf-tab-completion: FORCE
	git clone --depth 1 https://github.com/lincheney/fzf-tab-completion.git $@ 2> /dev/null || git -C $@ pull

clean:
	rm -fr fzf
	rm -fr fzf-tab-completion

install: fzf fzf-tab-completion
	fzf/install --xdg --key-bindings --completion --no-update-rc
	cp fzf-tab-completion/bash/fzf-bash-completion.sh ~/.config/fzf/
	cp fzf-tab-completion/zsh/fzf-zsh-completion.sh ~/.config/fzf/
	cp preview.sh ~/.config/fzf/

uninstall:
	rm -fr ~/.config/fzf

FORCE:
