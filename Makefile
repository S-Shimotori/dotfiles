all: install-xvim install-zsh install-vim install-neovim

install-vim:
	rm -f ~/.vimrc
	rm -rf ~/.vim/userautoload
	rm -rf ~/.vim/ftplugin
	mkdir -p ~/.vim/userautoload/init
	mkdir -p ~/.vim/userautoload/plugins
	mkdir -p ~/.vim/ftplugin
	ln -sf `pwd`/vim/.vimrc ~/.vimrc
	ln -sf `pwd`/vim/init/*.vim ~/.vim/userautoload/init/
	ln -sf `pwd`/vim/plugins/*.vim ~/.vim/userautoload/plugins/
	ln -sf `pwd`/vim/ftplugin/*.vim ~/.vim/ftplugin/

install-neovim:
	rm -rf ~/.config/nvim
	mkdir -p ~/.config/nvim
	ln -sf `pwd`/neovim/init.vim ~/.config/nvim/

install-xvim:
	rm -f ~/.xvimrc
	ln -sf `pwd`/.xvimrc ~/.xvimrc

install-zsh:
	git submodule update --init
	rm -f ~/.zshrc
	ln -sf `pwd`/.zshrc ~/.zshrc

