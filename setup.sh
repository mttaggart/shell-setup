#!/bin/bash

# Install Fish, Vim, TMux

install_apt_packages() {
	echo "[+] Installing apt packages"
	sudo apt update && sudo apt install -y fish vim-gtk3 tmux terminator
}

install_rust() {
	echo "[+] Installing Rust"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	echo 'set -x PATH $PATH ~/.cargo/bin'
	export PATH=$PATH:~/.cargo/bin
}

install_alacritty() {
	if [ ! -f ~/.cargo/bin/rustc ]; then
		echo "[!] Rust not found! Installing..."
		install_rust
	fi
	echo "[+] Installing Alacritty"
	cargo install alacritty
	echo "[+] Copying Desktop File"
	sudo cp ./Alacritty/Alacritty.desktop /usr/share/applications/
	echo "[+] Copying Config"
	mkdir ~/.config/alacritty
	cp ./Alacritty/*.yml ~/.config/alacritty/
}

install_nerdfont() {
	echo "[+] Installing NerdFont"
	wget -O ~/tmp/scp.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/SourceCodePro.zip
	mkdir /tmp/scp
	unzip /tmp/scp.zip -d /tmp/scp '*.ttf'
	sudo mkdir /usr/share/fonts/saucecode-pro
	sudo mv /tmp/*.ttf /usr/share/fonts/saucecode-pro
	rm -rf /tmp/scp
	sudo fc-cache -s -f
}

install_starship() {
	echo "[+] Installing Starship"
	curl -sS https://starship.rs/install.sh | sh
}

configure_starship() {
	echo "[+] Configuring Starship"
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

install_neovim() {
	# Optional Install NeoVim
	echo "[?] Install Neovim? [Y/n]"
	read neovim_confirm
	if [[ $neovim_confirm == "" ]] || [[ $neovim_confirm == "Y" ]] || [[ $neovim_confirm == "y" ]]; then
		echo "[+] Installing Neovim"
		wget -O /tmp/nvim.tar.gz 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz'
		cd /tmp
		tar zxvf nvim.tar.gz
		sudo cp -R nvim/* /usr/local/
		rm -rf nvim*
		cd -
		echo "[+] Installing Neovim config"
		git clone https://github.com/mttaggart/neovim-config ~/.config/nvim
		echo "[+] Setting Fish aliases"
		echo "alias nv=nvim" >>~/.config/fish/config.fish
	fi
}

install_apt_packages
install_alacritty
install_starship
install_nerdfont
configure_starship
configure_vim
configure_tmux
install_neovim
