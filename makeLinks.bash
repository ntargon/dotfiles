#!/bin/bash

for file in `find -maxdepth 1 -mindepth 1 -name ".*" -not -name ".git"` ; do
   ln -sf $HOME/dotfiles/${file:2} $HOME/${file:2}
done

