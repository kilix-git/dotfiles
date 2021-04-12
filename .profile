# $FreeBSD: releng/12.1/share/skel/dot.profile 337497 2018-08-08 19:24:20Z asomers $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

EDITOR=vim;   	export EDITOR
PAGER=vimpager;	export PAGER

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.bashrc; export ENV

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

# locale stuff
CHARSET=UTF-8;				export CHARSET
LANG=en_US.UTF-8; 			export LANG
LC_ALL=en_US.UTF-8;			export LC_ALL

# XDG home dir spec
XDG_CONFIG_HOME=$HOME/.config;		export XDG_CONFIG_HOME
XDG_CACHE_HOME=$HOME/.cache;		export XDG_CACHE_HOME
XDG_DATA_HOME=$HOME/.local/share;	export XDG_DATA_HOME		

# various stuff
GDK_USE_XFT=1;				export GDK_USE_XFT
QT_XFT=1;				export QT_XFT
OOO_FORCE_DESKTOP=gnome;		export OOO_FORCE_DESKTOP

#
GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc;		export GTK2_RC_FILES
LESSHISTFILE=-;						export LESSHISTFILE
VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'; export VIMINIT

alias ll="lsd -l"
alias la="lsd -lA"
alias lt="lsd -Sl"
alias lm="lsd -tl"
alias ls="lsd"
alias pls="doas"
alias rclonedown="rclone -Pv sync pCloud:/ /home/matej/cloud-local/"
alias rcloneup="rclone -Pv sync /home/matej/cloud-local/ pCloud:/"
alias rclonecheck="rclone -Pv check --size-only /home/matej/cloud-local/ pCloud:/"
alias eco="vim /home/matej/.config/spectrwm/spectrwm.conf"
alias keys="vim /home/matej/.config/spectrwm/spectrwm_my.conf"
alias signal="dbus-run-session /home/matej/bin/siggo-master/bin/siggo"
alias up="doas pkg update && doas pkg upgrade && doas pkg autoremove"
alias rev="cd ~/cloud-local/revizie/"
alias kp="killall picom"
alias non-aut="pkg query -e '%a = 0' %o"
alias btc="curl rate.sx"
alias revk="cd ~/cloud-local/revizie/knauf/2021/"
alias revn="cd ~/cloud-local/revizie/nafs-stroje/"
alias mm="cd ~/docs/music/"
