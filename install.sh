#!/bin/bash
echo "Backup current vim config!" 
if [ -d ~/.vim-backup ]; then
  rm -fr ~/.vim-backup
fi
mkdir -p ~/.vim-backup
mv ~/.vimrc ~/.vim-backup
mv ~/.vim ~/.vim-backup

echo "Install vim config!"
cp vimrc ~/.vimrc
vim -c "q" ~/.vimrc

echo "install finished, enjoy yourself!"
