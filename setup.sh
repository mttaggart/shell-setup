#!/bin/bash

# Install Fish, Vim, TMux, Zellij, Helix

install_dnf_packages() {
	echo "[+] Installing dnf packages"
	sudo dnf update && sudo dnf install -y \
		fish \
		vim-X11 \
		helix \
		tmux \
		alacritty \
		cmake \
		gcc \
		pkgconf-pkg-config \
		fontconfig \
		fontconfig-devel
}

install_rust() {
	echo "[+] Installing Rust"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	echo 'set -x PATH $PATH ~/.cargo/bin'
	export PATH=$PATH:~/.cargo/bin
}

install_nerdfont() {
	echo "[+] Installing NerdFont"
	wget -O /tmp/scp.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/SourceCodePro.zip
	unzip /tmp/scp.zip -d /tmp/scp '*.ttf'
	sudo mkdir /usr/share/fonts/saucecode-pro
	sudo mv /tmp/scp/*.ttf /usr/share/fonts/saucecode-pro
	rm -rf /tmp/scp
	sudo fc-cache -s -f
}

install_starship() {
	echo "[+] Installing Starship"
	curl -sS https://starship.rs/install.sh | sh
}

install_atuin() {
	curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
}

install_zellij() {
	cargo install zellij
	mkdir ~/.config/zellij
	cp ./Zellij/config.kdl ~/.config/zellij/
}

install_node() {
	echo "[+] Installing NodeJS/NPM"
	sudo dnf install -y npm
	sudo npm i -g n
	sudo n latest
}

install_deno() {
	echo "[+] Installing Deno"
	curl -fsSL https://deno.land/install.sh | sh
}

install_language_servers() {
	echo "[+] Installing Language Servers"
	sudo npm i -g \
		typescript \
		typescript-language-server \
		pyright \
		bash-language-server \
		dockerfile-language-server-nodejs \
		@microsoft/compose-language-service
	wget -O /tmp/marksman https://github.com/artempyanykh/marksman/releases/download/2024-12-18/marksman-linux-x64
	chmod +x /tmp/marksman
	sudo mv /tmp/marksman /usr/local/bin/
	
}

configure_helix() {
	echo "[+] Configuring Helix"
	mkdir ~/.config/helix
	cp -R ./Helix/* ~/.config/helix/
}

configure_fish() {
	echo "[+] Configuring Fish"
	mkdir ~/.config/fish
	cp ./Fish/* ~/.config/fish
}

configure_starship() {
	echo "[+] Configuring Starship"]
	cp ./Starship/starship.toml ~/.config/starship.toml
}

configure_vim() {
	echo "[+] Configuring Vim"
	echo "[+] Installing Vim-Plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "[+] Copying .vimrc"
	cp ./Vim/.vimrc ~/.vimrc
	echo "[+] Remember to run :PlugInstall to install plugins!"
}

configure_tmux() {
	echo "[+] Configuring TMux"
	echo "[+] Installing TPM"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "[+] Installing TMux Conf"
	cp ./Tmux/.tmux.conf ~/.tmux.conf
	echo "[+] Remember to press C-B+I to install!"
}


install_dnf_packages
install_node
install_deno
install_starship
install_atuin
install_nerdfont
install_zellij
install_language_servers
configure_fish
configure_starship
configure_vim
configure_tmux
configure_helix
