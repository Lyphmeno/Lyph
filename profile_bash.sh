#!/bin/bash
# 	SHOW MENU
mysh=$(basename "$SHELL")
# Function to change GitHub user information
change_github_info()
{
    local username=$1
    local email=$2

    git config --global user.name "$username"
    git config --global user.email "$email"
}

# Function to get escape sequences for arrow keys
get_arrow_sequence()
{
    IFS= read -rsn1 key
    while IFS= read -rsn1 -t 0.0001; do
        key+=$REPLY
    done
    echo "$key"
}

# Function to prompt for a new GitHub user
prompt_for_new_user()
{
    echo -n "Enter new GitHub username: "
    read new_username
    echo -n "Enter new GitHub email: "
    read new_email
    change_github_info "$new_username" "$new_email"
    echo -e "\nGitHub user information changed to:"
    echo -e "Username: \e[1;32m$new_username\e[0m"
    echo -e "Email: \e[1;32m$new_email\e[0m"
}

#Function to setup templates files
create_templates()
{
    local selected_profile=$1

    # Define the folder name based on the selected profile
    local folder_name="Templates/TemplateFiles${selected_profile}"

    # Check if the folder exists
    if [ -d "$folder_name" ]; then
        # Adding all the templates files
        cat $folder_name/basicHPP > ~/.templates/.basicHPP
        cat $folder_name/basicCPP > ~/.templates/.basicCPP
        cat $folder_name/makexc > ~/.templates/.makexc
        cat $folder_name/makexcpp > ~/.templates/.makexcpp
        # Writting the rc config file 
        unalias -a
        cat $folder_name/rcTemplate > ~/."$mysh"rc
        if [ ! -e ~/.inputrc ]; then
            echo '$include /etc/inputrc' > ~/.inputrc
            if [ $mysh = "bash" ]; then
                bind 'set completion-ignore-case on'
            fi
        fi
        cat $folder_name/rcinput > ~/.inputrc
    else
        echo -e "\nFolder $folder_name does not exist."
    fi
}

# Function to display the menu
show_menu()
{
    local selected=1
    local option_names=("Lyfmeno" "Utu" "Shepard" "Atsuko" "NEW")
    local github_usernames=("Lyfmeno" "ShuBei33" "Shepardinio" "maverqui" "NEW_GITHUB_USER")
    local github_emails=("hugolevipro@gmail.com" "estoffel@student.42.fr" "mel-yand@student.42.fr" "maeverquin13@gmail.com" "newuser@example.com")
    local max_len=0

    # Find the maximum length of option_names
    for name in "${option_names[@]}"; do
        len=${#name}
        [ $len -gt $max_len ] && max_len=$len
    done

    local total_options=$(( ${#option_names[@]} + 1 ))
    local rangeopt=$(( ${total_options} - 1))
    local box_width=$((max_len + 10))
    tput cup 0 0
    while true; do
        tput clear
        echo -e "\n\t\t  USER"
        echo -e "\t  ┌─$(printf '─%.0s' $(seq 1 $box_width))─┐"
        for i in $(seq 1 $rangeopt); do
            if [ $i -eq $selected ]; then
                echo -e "\t→ │ \e[1;37;44m${option_names[$i-1]}\e[0m$(printf ' %.0s' $(seq 1 $((box_width - ${#option_names[$i-1]}+1))))│"
            else
                echo -e "\t  │ \e[0;37;40m${option_names[$i-1]}\e[0m$(printf ' %.0s' $(seq 1 $((box_width - ${#option_names[$i-1]}+1))))│"
            fi
        done
        echo -e "\t  └─$(printf '─%.0s' $(seq 1 $box_width))─┘"

        key=$(get_arrow_sequence)

        case $key in
            $'\e[A') # Up arrow
                ((selected--))
                [ $selected -lt 1 ] && selected=$total_options
                ;;
            $'\e[B') # Down arrow
                ((selected++))
                [ $selected -gt $total_options ] && selected=1
                ;;
            '') # Enter key
                if [ ${option_names[$selected-1]} = "NEW" ]; then
                    prompt_for_new_user
                else
                    change_github_info "${github_usernames[$selected-1]}" "${github_emails[$selected-1]}"
                    echo -e "GitHub user information changed to:"
                    echo -e "Username: \e[1;32m${github_usernames[$selected-1]}\e[0m"
                    echo -e "Email: \e[1;32m${github_emails[$selected-1]}\e[0m"
                    create_templates "${option_names[$selected-1]}"
                fi
                break
                ;;
            $'\e') # ESC key
                exit
                ;;
        esac
    done
}

# Display the menu
show_menu
