REPO="https://github.com/tasnimAlam/dot-files"
DOTDIR=$HOME/.my-dotfiles/

if [ -d $HOME/.my-dotfiles ]; then
   rm -r $HOME/.my-dotfiles/
fi

git clone $REPO $DOTDIR

cd $DOTDIR

echo "_______________________________"
# zshrc file
echo  "Install zsh file ? ( y / n )"
read -r response

if [ "$response" = "y" ]; then
    if [ -f .zshrc ]; then
        mv $HOME/.zshrc $HOME/.zshrc-backup
        cp .zshrc $HOME/.zshrc
    else
        cp .zshrc $HOME/.zshrc
    fi
    echo "copied zshrc"
fi

# vimrc file
echo  "Install vimrc file ? ( y / n )"
read -r response

if [ "$response" = "y" ]; then
    if [ -f $HOME/.vimrc ]; then
        mv $HOME/.vimrc $HOME/.vimrc-backup
        cp .vimrc $HOME/.vimrc
    else
        cp .vimrc $HOME/.vimrc
    fi

    if [ -f $HOME/.config/nvim/init.vim ]; then
        mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim-backup
        cp .config/nvim/init.vim $HOME/.config/nvim/init.vim
    else
        cp .config/nvim/init.vim $HOME/.config/nvim/init.vim
    fi
    echo "copied vimrc"
fi

# kitty config
echo  "Install kitty config ? ( y / n )"
read -r response

if [ "$response" = "y" ]; then
    if [ -d $HOME/.config/kitty ]; then
        mv $HOME/.config/kitty $HOME/.config/kitty-backup
        cp -r .config/kitty $HOME/.config/kitty
    else
        cp -r .config/kitty $HOME/.config/kitty
    fi
    echo "copied kitty config"
fi

# doom config
echo  "Install doom config ? ( y / n )"
read -r response

if [ "$response" = "y" ]; then
    if [ -d $HOME/.doom.d ]; then
        mv $HOME/.doom.d $HOME/.doom.d-backup
        cp -r .doom.d $HOME/.doom.d
    else
        cp -r .doom.d $HOME/.doom.d
    fi
    echo "copied doom config"
fi

rm -rf $HOME/.my-dotfiles
