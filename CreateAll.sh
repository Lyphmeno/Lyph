#!/bin/sh
mysh=`echo $SHELL | cut -d/ -f3`
# Creating files
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
while true; do
    read -p "Do you wish to add the brew source ? [Y/N]" yn
    cat TemplateFiles/rcTemplate > ~/."$mysh"rc
    case $yn in
        [Yy]* ) echo ". \$HOME/.brewconfig.zsh" >> ~/."$mysh"rc | echo "Added source for Brew" ; break;;
        [Nn]* ) echo "No source Added for brew" ; break;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
    read -p "Do you wish to add an alias for Neovim ? [Y/N]" yn
    cat TemplateFiles/rcTemplate > ~/."$mysh"rc
    case $yn in
        [Yy]* ) echo "alias nvim='~/nvim-linux64/bin/nvim'" >> ~/."$mysh"rc | echo "Added alias for nvim" ; break;;
        [Nn]* ) echo "No alias added for nvim" ;break;;
        * ) echo "Please answer yes or no.";;
    esac
done
