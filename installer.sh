mkdir -p ~/.local/bin
mkdir -p ~/.local/etc/class_creator

cp utils/* ~/.local/etc/class_creator

cp class_creator.sh ~/.local/bin/class_creator.sh

chmod +x ~/.local/bin/class_creator.sh

echo "Do you want to update PATH to always search for executables in ~/.local/bin?(Y/N)"



while [[ "$response" != "Y" && "$response" != "N" && "$response" != "y" && "$response" != "n" ]]; do
    read -r response

    if [[ "$response" == 'Y' ]] || [[ "$response" == 'y' ]]; then
        if [[ "$SHELL" == *"bash"* ]]; then
            echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
        elif [[ "$SHELL" == *"zsh"* ]]; then
            echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc
        else
            echo "This feature is only compatible in bash and zsh :("
			break
		fi
		export PATH="$HOME/.local/bin/:$PATH"
		echo "PATH has been successfully updated."
		break
    elif [[ "$response" == 'N' ]] || [[ "$response" == 'n' ]]; then
        echo "Ok, remember to put .local/bin in PATH!"
    else
        echo "You need to put 'Y' or 'N'"
    fi
done