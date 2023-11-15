
# LYPH 

This repository is a save of all the aliases and functions I like to have on my linux. From git function to cpp or hpp generator, this file help me a lot when I need to setup a new machine.\
The program should work on any `.rc` file type.
## Installation

Since I am using Neovim as my IDE there is a question about Homebrew (I only need it when I am at 42 School so don't mind it).

This said the installation is quite simple, just run this :
### Clone the repo
```bash
    git clone --recursive https://github.com/Lyfmeno/Lyph.git 
```
### Setup and chose profile
```bash
    ./SETUP.sh
```
### Update terminal (close reopen) or:
First time using (depends on $SHELL)
```bash
    source ~/.bashrc
```
Else (the function will find )
```bash
    rsource
```
### Update submodule
```bash
    git submodule update --init --recursive
```

The recursive option is very important since I allowed my friends to make their own templates !!!

## Files

The Template file contains everything I need :

- `rcTemplate` is the template for the rc file at the root of your computer, it will REPLACE your `*.rc` file.
- `basicCPP/basicHPP` are the templates used to generate cpp and hpp file with canonical form
- `makexc/makexcpp` are the templates used to generate *Makefile* depending on language (_Fun little progress bar btw_)
## Function Description
### Edit
Simple aliases to make it easier for me to navigate and change configuration files and stuff.
### Gup
Theses functions make it so when I change, for exemple, my `reTemplate` then it automatically update mine and push to my git the changes.
### Makefile
Generates makefile taking first argument as the name of the executable for `C` or `C++`.\
If needed, put `./src/*` and `./inc/*` in the Makefile.
### Gen
Generates `.hpp/.cpp` as a class file.\
First argument will define the name of the class and the canonical form will contain the right class name.
### Git
Easier git aliases with colors.\
`fullgit()` will add/commit/push everything added or deleted on origin. Everything following the function in the command line will be the commit message.
