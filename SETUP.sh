#!/bin/sh
current_shell=$(basename "$SHELL")
mysh="$current_shell"
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
TEMPLATES_DIR="$SCRIPT_DIR/Templates"
RC_TEMPLATE="$TEMPLATES_DIR/rcTemplate"
RC_INPUT="$TEMPLATES_DIR/rcinput"
TARGET_RC="$HOME/.${mysh}rc"

change_github_info() {
    username="$1"
    email="$2"

    git config --global user.name "$username"
    git config --global user.email "$email"

    echo "GitHub credential update :"
    echo "  user.name  = $username"
    echo "  user.email = $email"
}

apply_rc_template() {
    if [ ! -f "$RC_TEMPLATE" ]; then
        echo "Errorr : rcTemplate is not found in $SCRIPT_DIR"
        exit 1
    fi

    # Remplace complètement ~/.bashrc ou ~/.zshrc
    cat "$RC_TEMPLATE" > "$TARGET_RC"
    echo "Updated $TARGET_RC from rcTemplate."

    # Optionnel : gestion basique de ~/.inputrc (une seule fois)
    if [ ! -e "$HOME/.inputrc" ]; then
        echo '$include /etc/inputrc' > "$HOME/.inputrc"
    fi
}

main() {
    echo "Shell detected : $current_shell"

    case "$current_shell" in
        bash|zsh)
            change_github_info "Lyphmeno" "hugolevipro@gmail.com"
            apply_rc_template
            ;;
        *)
            echo "Shell not supported : $current_shell"
            ;;
    esac

    cd || exit 1
    mkdir -p 42 42/Github 42/Vogsphere
    cd - > /dev/null 2>&1 || true
    echo "Setup done. don't forget to :"
    echo "source ~/.${mysh}rc"
}

main