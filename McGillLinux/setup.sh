dir="~/McGillLinux/"

cp -R ~/McGillLinux/savant ~/
cp ~/McGillLinux/.vimrc ~/.vimrc
cp ~/McGillLinux/.bashrc ~/.bashrc
cp ~/McGillLinux/.Xdefaults ~/.Xdefaults

mkdir ~/.vim
mkdir ~/.vim/colors
cp ~/McGillLinux/wiltz.vim ~/.vim/colors/wiltz.vim

mkdir ~/.savant
cp ~/constants ~/.savant/constants
cp ~/savant/logo ~/.savant/logo
