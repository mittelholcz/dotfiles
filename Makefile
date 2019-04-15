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
	[ -z $$(which vim) ] \
		&& { echo 'Intsall vim before run this target!' ; exit 1 ; } \
		|| exit 0
	@echo 'OK'
	@[ -L ~/.vimrc ] && rm ~/.vimrc ; ln -rsb vim/vimrc ~/.vimrc
	@[ -L ~/.vimplug ] && rm ~/.vimplug ; ln -rsb vim/vimplug ~/.vimplug
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@vim -u vim/vimplug +PlugInstall +qall
	@[ -L ~/.purevimrc ] \
		&& echo '.purevimrc is a symlink' \
		|| ln -rsb vim/purevimrc ~/.purevimrc
	@echo 'Done.'
.PHONY: vim


desktop: scripts/setup-ubuntu-18.04-desktop.sh
	@./$<
.PHONY: desktop


docker: scripts/install-docker.sh
	@sudo ./$< $${USER}
.PHONY: docker
