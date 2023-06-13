#!/bin/bash

mkdir $HOME/.config

# Symlink to $HOME/.config
configdirs=(alacritty btop nvim ranger bspwm sxhkd polybar offlineimap notmuch alot msmtp spicetify starship.toml i3 picom.conf lazygit rofi bat)
for d in "${configdirs[@]}"
do
  target=$HOME/.config/$d
  [ -f $target ] && unlink $target || rm -rf $target
  ln -s $HOME/.files/$d $target
done

# Symlink to $HOME
homedirs=(tmux.conf xinitrc zshrc zshenv notmuch-config yabairc skhdrc)
for d in "${homedirs[@]}"
do
  target=$HOME/.$d
  [ -f $target ] && unlink $target || rm -rf $target
  ln -s $HOME/.files/$d $target
done

# Special maildir fun
ln -s $HOME/Mail /var/spool/mail/albarn

