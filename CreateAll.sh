#!/bin/sh
mysh=`echo $SHELL | cut -d/ -f3`
# Creating files
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
mkdir -p ~/.templates
touch ~/.templates/.basicHPP
touch ~/.templates/.basicCPP
touch ~/.templates/.makexc
touch ~/.templates/.makexcpp
# Adding all the templates files
cat TemplateFiles/basicHPP > ~/.templates/.basicHPP
cat TemplateFiles/basicCPP > ~/.templates/.basicCPP
cat TemplateFiles/makexc > ~/.templates/.makexc
cat TemplateFiles/makexcpp > ~/.templates/.makexcpp

# Writting the rc config file 
unalias -a
cat TemplateFiles/rcTemplate > ~/."$mysh"rc
. ~/."$mysh"rc