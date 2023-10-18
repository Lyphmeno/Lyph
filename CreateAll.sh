#!/bin/sh
cd
mkdir -p 42 42/Ghub 42/Vogsphere
mysh=`echo $SHELL | cut -d/ -f3`
cd -
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
cat TemplateFiles/rcTemplate > ~/."$mysh"rc
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
cat TemplateFiles/rcinput > ~/.inputrc
