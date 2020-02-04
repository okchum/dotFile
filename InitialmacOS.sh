#!/bin/bash

. ./functions.sh

cd ~
sudo rm -rf ~/Documents ~/Downloads
ln -s /Volumes/Data/Documents ~/Documents
ln -s /Volumes/Data/Downloads ~/Downloads


# Switching ZSH shell
switch_shell_msg="Switching zsh shell"
switch_shell_cmd="chsh -s /bin/zsh"
execute_command "\${switch_shell_msg}" "\${switch_shell_cmd}"

# Installing oh-my-zsh
install_ohmyzsh_msg="Installing oh-my-zsh via https://github.com/robbyrussell/oh-my-zsh"
install_ohmyzsh_cmd='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
execute_command "\${install_ohmyzsh_msg}" "\${install_ohmyzsh_cmd}"

# Installing PIP via easy_install
install_pip_msg="Installing pip"
install_pip_cmd="sudo easy_install pip"
execute_command "\${install_pip_msg}" "\${install_pip_cmd}"

# Installing library via pip
pip_install_lib_msg="installing mackup from pip"
pip_install_lib_cmd=cmd="sudo pip install mackup"
execute_command "\${pip_install_lib_msg}" "\${pip_install_lib_cmd}"

# Installing Brew via https://brew.sh
install_brew_msg="Installing brew from https://brew.sh"
install_brew_cmd='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
execute_command "\${install_brew_msg}" "\${install_brew_cmd}"

# Check Brew
check_brew_msg="Testing Brew"
check_brew_cmd="brew doctor"
execute_command "\${check_brew_msg}" "\${check_brew_cmd}"

# Installing apps via Brew
brew_install_apps_msg="wget openssl xz pcre gdbm zsh aria2 go node automake autoconf mobile-shell composer php-cs-fixer gpg tldr apktool dex2jar"
brew_install_apps_cmd="Installing $INSTALLFROMBREW via Brew"
execute_command "\${brew_install_apps_msg}" "brew install \${brew_install_apps_cmd}"


# Installing Apps via BrewCask
brew_cask_list=(
    ## Password management
    '1password6' 'enpass' 'lastpass' \

    ## Jetbrains
    'jetbrains-toolbox' \

    ## Editors
    'sublime-text' 'visual-studio-code' \

    ## Dev tools
    'iterm2' 'fork' 'coderunner' 'robo-3t' 'charles' 'wireshark' 'dash' \

    ## Browsers
    'brave-browser' 'firefox' 'firefox-developer-edition' 'google-chrome' 'tor-browser' \

    ## Utilities
    'adguard' 'alfred' 'bartender' 'bettertouchtool' 'bob' 'cheatsheet' 'default-folder-x' 'dropbox' 'eudic' 'hammerspoon' 'keyboard-maestro8' \
    'mysqlworkbench' 'shadowsocksx-ng' 'slack' 'squirrel' 'surge' 'teamviewer' \

    ## Entertaiment
    'iina' 'kodi' 'plex-media-player' 'spotify' \


    'aria2gui' 'skype' 'snipaste' 'istat-menus' \

    ## Trial 
    'ghosttile'  \

    ## Design Tools
    'balsamiq-mockups' 
	)

for item in ${brew_cask_list[@]}; do
    brew_install_apps_cmd="brew cask install ${item}"
	execute_command "\${brew_install_apps_cmd}" "\${brew_install_apps_cmd}"
done 

# Linking SSH config
ln -s /Volumes/Data/Dropbox/Live/ssh ~/.ssh
chmod -R 500 ~/.ssh
ln -s /Volumes/Data/Dropbox/Workspaces ~/Workspaces

# Development enviroment
# vagrant box add laravel/homestead /path/to/virtualbox.box 
# composer global require "laravel/homestead"

