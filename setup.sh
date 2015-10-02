dir="~/McGillLinux/"

cp -R ~/McGillLinux/savant ~/
cp ~/McGillLinux/.vimrc ~/.vimrc
touch ~/.bashrc
cp ~/McGillLinux/.bashrc ~/.bashrc
cp ~/McGillLinux/.Xdefaults ~/.Xdefaults

mkdir ~/.vim
mkdir ~/.vim/colors
cp ~/McGillLinux/wiltz.vim ~/.vim/colors/wiltz.vim

mkdir ~/.savant
cp ~/McGillLinux/constants ~/.savant/constants
cp ~/McGillLinux/savant/logo ~/.savant/logo
