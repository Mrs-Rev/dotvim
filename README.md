dotvim
======
My .vim configuration.

Installation:
-------------
Clone the .vim and vundle:

	git clone https://github.com/Mrs-Rev/dotvim.git ~/.vim
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


Rename the existing .vimrc file and replace with a link to my vimrc.

	cd ~
	mv .vimrc .vimrc_OLD
	ln -s .vim/.vimrc .vimrc 
	vim +BundleInstall +qall
