.PHONY: all clean install uninstall
all: fzf fzf-tab-completion

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git $@

fzf-tab-completion:
	git clone --depth 1 https://github.com/lincheney/fzf-tab-completion.git $@

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
