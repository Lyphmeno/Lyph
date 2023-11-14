#!/bin/sh
# Creating files
mkdir -p ~/.templates
touch ~/.templates/.basicHPP
touch ~/.templates/.basicCPP
touch ~/.templates/.makexc
touch ~/.templates/.makexcpp

# Profile Selection
zsh git_setup_menu.sh
cd
mkdir -p 42 42/Ghub 42/Vogsphere
cd - > /dev/null 2>&1