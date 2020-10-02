cd $HOME

# remove or restore zshrc
if [ -f $HOME/.zshrc-backup ]; then
    mv $HOME/.zshrc-backup $HOME/.zshrc
    echo "restored $HOME/.zshrc"
else
    rm $HOME/.zshrc-test
    echo "deleted $HOME/.zshrc"
fi


# remove or restore vimrc
if [ -f $HOME/.vimrc-backup ]; then
    mv $HOME/.vimrc-backup $HOME/.vimrc
    echo "restored $HOME/.vimrc"
else
    rm $HOME/.vimrc-test
    echo "deleted $HOME/.vimrc"
fi

# remove or restore kitty
if [ -d $HOME/.config/kitty-backup ]; then
    mv $HOME/.config/kitty-backup $HOME/.config/kitty
    echo "restored $HOME/.config/kitty"
else
    rm -rf $HOME/.config/kitty-test
    echo "deleted $HOME/.config/kitty"
fi

# remove or restore doom
if [ -d $HOME/.doom.d-backup ]; then
    mv $HOME/.doom.d-backup $HOME/.doom.d
    echo "restored $HOME/.doom.d"
else
    rm -rf $HOME/.doom.d-test
    echo "deleted $HOME/.doom.d"
fi
