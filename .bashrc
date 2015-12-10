# Created by harwiltz

alias ls='ls --color=auto'
alias grep='grep -n --color=auto'
alias savant='~/McGillLinux/savant/a.out'
alias gtfo='xrdb -merge .Xdefaults && exit'

#color_blue='\e[0;34m'
#color_cyan='\e[0;36m'
#color_reset='\e[0m'
#export PS1="┌─[$color_blue\u$color_reset][$color_cyan\W$color_reset]\n└─>▪" 

PS1="\[\033[ 01;37m\]\$(exit=\$?; if [[ \$exit == 0 ]]; then echo \"\[\033[01;32m\]✓\"; else echo \"\[\033[01;31m\]✗ \$exit\"; fi) \[\033[01;32m\]\u\[\033[01;34m\] \W \$\[\033[00m\] "

alias showtime='tty-clock -s -c'
alias listen='mp3blaster'
alias sdmf='xinit bspwm'
alias hotkeys='vim ~/.config/sxhkd/sxhkdrc'
alias blackhawkdown='shutdown -h now'
alias updatefonts='fc-cache -vf'
alias nettest='ping -c 3 www.google.com'
alias interface='wlp3s0'
alias editvimcolors='sudo vim /usr/share/vim/vim74/colors'
alias pokerstars='C:\\Program\ Files\ (x86)\\PokerStars\\PokerStars.exe'
alias tig2d='wine ~/win32/drive_c/"Program Files"/"Tigarmageddon2D"/"Tigarmageddon 2D.exe"'


