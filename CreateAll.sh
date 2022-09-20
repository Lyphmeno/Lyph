#!/bin/sh 
# Adding all the templates files 
cat TemplateFiles/basicHPP > ~/.templates/.basicHPP
cat TemplateFiles/basicCPP > ~/.templates/.basicCPP
cat TemplateFiles/makexc > ~/.templates/.makexc
cat TemplateFiles/makexcpp > ~/.templates/.makexcpp

# Writting the rc config file 
unalias -a
cat TemplateFiles/rcTemplate > ~/.zshrc
. ~/.zshrc