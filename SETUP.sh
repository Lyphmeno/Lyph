#!/bin/sh
# Creating files
mkdir -p ~/.templates
touch ~/.templates/.basicHPP
touch ~/.templates/.basicCPP
touch ~/.templates/.makexc
touch ~/.templates/.makexcpp

# Profile Selection
current_shell=$(basename "$SHELL")
if [ "$current_shell" = "bash" ]; then
    echo "Executing Bash profile..."
    bash profile_bash.sh
elif [ "$current_shell" = "zsh" ]; then
    echo "Executing Zsh profile..."
    zsh profile_zsh.sh
else
    echo "Unsupported shell: $current_shell"
fi
cd
mkdir -p 42 42/Ghub 42/Vogsphere
cd - > /dev/null 2>&1