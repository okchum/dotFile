#!/bin/bash

Execute_Command()
{
    eval MESSAGE="$1"
    eval COMMAND="$2"
    echo ${MESSAGE}
    echo "Command: "${COMMAND}
    eval ${COMMAND}
}

# Disabling TimeMachine local backup
Disable_TM_Local_Msg="Disabling TimeMachine local backup"
Disable_TM_Local_Cmd='sudo tmutil disablelocal'
Execute_Command "\${Disable_TM_Local_Msg}" "\${Disable_TM_Local_Cmd}"

# Switching ZSH shell
Switch_Shell_Msg="Switching zsh shell"
Switch_Shell_Cmd="chsh -s /bin/zsh"
Execute_Command "\${Switch_Shell_Msg}" "\${Switch_Shell_Cmd}"

# Installing oh-my-zsh
Install_OHMYZSH_Msg="Installing oh-my-zsh via https://github.com/robbyrussell/oh-my-zsh"
Install_OHMYZSH_Cmd='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
Execute_Command "\${Install_OHMYZSH_Msg}" "\${Install_OHMYZSH_Cmd}"

# Installing PIP via easy_install
Install_PIP_Msg="Installing pip"
Install_PIP_Cmd="sudo easy_install pip"
Execute_Command "\${Install_PIP_Msg}" "\${Install_PIP_Cmd}"

# Installing library via pip
PIP_Install_Lib_Msg="installing mackup from pip"
PIP_Install_Lib_Cmd="sudo pip install mackup"
Execute_Command "\${PIP_Install_Lib_Msg}" "\${PIP_Install_Lib_Cmd}"

# Installing Brew via https://brew.sh
Install_Brew_Msg="Installing brew from https://brew.sh"
Install_Brew_Cmd='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
Execute_Command "\${Install_Brew_Msg}" "\${Install_Brew_Cmd}"

# Check Brew
Check_Brew_Msg="Testing Brew"
Check_Brew_Cmd="brew doctor"
Execute_Command "\${Check_Brew_Msg}" "\${Check_Brew_Cmd}"

# Installing apps via Brew
Brew_Install_Apps_Msg="wget openssl xz pcre gdbm zsh aria2 go node automake autoconf docker docker-compose mobile-shell homebrew/php/composer homebrew/php/php-cs-fixer gpg tldr"
Brew_Install_Apps_Cmd="Installing $INSTALLFROMBREW via Brew"
Execute_Command "\${Brew_Install_Apps_Msg}" "brew install \${Brew_Install_Apps_Cmd}"


# Installing BrewCask
Install_HomebrewCask_Msg="Installing BrewCask via https://caskroom.github.io"
Install_HomebrewCask_Cmd="brew tap caskroom/cask"
Execute_Command "\${Install_HomebrewCask_Msg}" "\${Install_HomebrewCask_Cmd}"

# Installing Apps via BrewCask
HomebrewCask_List=(
    '1password' 'enpass' 'alfred' 'dropbox' 'google-chrome' 'vivaldi' \
    'iterm2' 'sublime-text' 'virtualbox' 'mplayerx' 'iina'\
	'aria2gui' 'robomongo' 'skype' 'atom' 'balsamiq-mockups' 'charles' 'coderunner' \

	'dash' 'squirrel' 'bettertouchtool' 'cheatsheet' \
	'jetbrains-toolbox' 'pycharm' 'phpstorm' 'rubymine' 'appcode' 'datagrip' 'intellij-idea' 'webstorm' \
	'eudic' 'default-folder-x' 'keyboard-maestro' 'karabiner' 'vagrant' 'sourcetree' 'tower' \
	'shadowsocksx-ng' 'surge' 'sequel-pro' 'bartender' 'teamviewer' \
	# Trial
	 'xee'
	)

for Item in ${HomebrewCask_List[@]}; do
    HomeBrew_Install_Apps_Cmd="brew cask install ${Item}"
	Execute_Command "\${HomeBrew_Install_Apps_Cmd}" "\${HomeBrew_Install_Apps_Cmd}"
done 

# Linking SSH config
cd ~ && ln -s ~/Dropbox/Live/ssh/ .ssh

# Development enviroment
# vagrant box add laravel/homestead
# vagrant box add laravel/homestead /path/to/virtualbox.box 
# composer global require "laravel/homestead"

