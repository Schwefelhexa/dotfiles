#!/bin/sh

mkdir $HOME/.config

# Symlink to $HOME/.config
configdirs=(alacritty btop nvim ranger bspwm sxhkd polybar offlineimap notmuch alot msmtp)
for d in "${configdirs[@]}"
do
  target=$HOME/.config/$d 
  [ -f $target ] && unlink $target || rm -rf $target
  ln -s $HOME/.files/$d $target
done

# Symlink to $HOME
homedirs=(ssh tmux.conf xinitrc zshrc)
for d in "${homedirs[@]}"
do
  target=$HOME/.$d 
  [ -f $target ] && unlink $target || rm -rf $target
  ln -s $HOME/.files/$d $target
done

# Special maildir fun
ln -s ~/.files/notmuch/default/config ~/.notmuch-config
ln -s $HOME/Mail /var/spool/mail/albarn

