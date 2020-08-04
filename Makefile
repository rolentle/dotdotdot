.DEFAULT_GOAL := install

dotfiles = .gitconfig \
				.tmux.conf \
				.zshrc

install: shell symlink vim

cyan = "\\033[1\;96m"
off  = "\\033[0m"
echo.%:
	@echo "\n$(cyan)Building $*$(off)"

shell: echo.shell
	bin/shell

symlink: echo.symlink
	@for file in $(dotfiles); do \
		rm -rf ~/$$file ;\
		ln -s $(shell pwd)/$$file ~/$$file ;\
	done

vim: echo.vim
	mkdir -p ~/.config/nvim ;\
	rm -rf ~/.config/nvim/init.vim ;\
	ln -s $(shell pwd)/init.vim ~/.config/nvim/init.vim ;\
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;\
	nvim --headless +PlugInstall +qa

