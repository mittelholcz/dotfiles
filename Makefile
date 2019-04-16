all: shell vim
.PHONY: all


shell: dots/bashrc dots/mybashrc dots/bash_logout dots/inputrc
	@echo 'Shell ... '
	@mkdir -p ~/bin
	@curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh >~/bin/git-prompt.sh
	@cp -fb dots/bashrc ~/.bashrc
	@[ -L ~/.mybashrc ] \
		&& echo '.mybashrc is a symlink' \
		|| ln -sb $$(pwd)/dots/mybashrc ~/.mybashrc
	@[ -L ~/.bash_logout ] \
		&& echo '.bash_logout is a symlink' \
		|| ln -sb $$(pwd)/dots/bash_logout ~/.bash_logout
	@[ -L ~/.inputrc ] \
		&& echo '.inputrc is a symlink' \
		|| ln -sb $$(pwd)/dots/inputrc ~/.inputrc
	@echo 'Done.'
.PHONY: shell


restore_shell:
	@echo 'Restore default .bashrc, .bash_logout and .inputrc.'
	@rm -f ~/.bashrc
	@rm -f ~/.mybashrc
	@rm -f ~/.bash_logout
	@rm -f ~/.inputrc
	@[ -f ~/.bashrc~ ] && mv ~/.bashrc~ ~/.bashrc \
		|| echo 'original bashrc do not exist'
	@[ -f ~/.bash_logout~ ] && mv ~/.bash_logout~ ~/.bash_logout \
		|| echo 'original bash_logout do not exist'
	@[ -f ~/.inputrc~ ] && mv ~/.inputrc~ ~/.inputrc \
		|| echo 'original inputrc do not exist'
	@echo 'Done.'
.PHONY: restore_shell


vim: vim/vimrc
	@echo 'Vim:'
	@[ $$(which vim) ] || { echo 'Vim is not installed!' ; exit 1 ; }
	@rm -rf ~/.vim ; mkdir -p ~/.vim
	@ln -sb $$(pwd)/vim/purevimrc ~/.vim/purevimrc
	@[ -L ~/.vimrc ] && rm ~/.vimrc ; ln -sb $$(pwd)/vim/vimrc ~/.vimrc
	@vim --version | head -n1 | egrep -q "7\.[0-2]" || { \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ; \
		ln -sb $$(pwd)/vim/vimplug ~/.vim/vimplug ; \
		vim -u ~/.vim/vimplug +PlugInstall +qall ; }
	@echo 'Done.'
.PHONY: vim


desktop: scripts/setup-ubuntu-18.04-desktop.sh
	@./$<
.PHONY: desktop


docker: scripts/install-docker.sh
	@sudo ./$< $${USER}
.PHONY: docker
