#!/bin/bash

###############################################################
# Script Name 	: Yuml-Setup 
# Description	: Config VIM for YAML editing and add EverForest CS
# Args		: n/a
# Example	: n/a
# Author	: zpc
# Email		: zpc@zspec.dev
# Date		: Jan 2023
###############################################################

echo ":: Configuring VIM for Everforest ColorScheme and YAML editing/linting"
echo ""
echo ":: Install Everforest colorscheme" 
echo "" 

##Setup Everforest ColorScheme
mkdir -p ~/.vim/pack/colors/opt
git clone --depth 1 https://github.com/sainnhe/everforest.git ~/.vim/pack/colors/opt/everforest
 
echo ""
echo ":: Install ALE vim Linter"
echo "" 

##Setup ale linter
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale

echo "" 
echo ":: Checking if system uses DNF"
echo ""


##Confirm system is a DNF based OS
if [ -n "$(command -v dnf)" ]; 
    then echo ":: Confirmed this is a DNF based OS."
else 
    echo "THIS IS NOT A DNF BASED OS, EXITING INSTALLER"    
    exit 1;
fi

echo ""
echo ":: Checking for pip3"
echo "" 

##Check if Pip3 is installed
if ! which pip3 > /dev/null; then
    echo -e "pip3 not found! Install? (y/n) \c"
    read
    if [[ $REPLY == "y" ]]; then 
	echo ":: Installing pip3"
        sudo dnf install pip3
    else
	echo ":: Skipping pip3 install"
    fi
fi

echo ""
echo ":: Checking for yamllint"
echo ""

##Check if yamllint is installed
if ! which yamllint > /dev/null; then 
    echo -e "yamllint not found! Install? (y/n) \c"
    read
    if [[ $REPLY == "y" ]]; then
        echo ":: Installing yamllint"
        sudo pip3 install yamllint
    else
	echo ":: Skipping yamllint install"
    fi
fi

echo ""
echo ":: Setting up ~/.vimrc file"
echo "" 

echo -e "packadd! everforest\ncolorscheme everforest\nset number\n\n\nautocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab\n\nset foldlevelstart=20\n\nlet g:ale_echo_msg_format = '[%linter%] %s [%severity%]'\nlet g:ale_sign_error = '✘'\nlet g:ale_sign_warning = '⚠'\nlet g:ale_lint_on_text_changed = 'always'\n" >> ~/.vimrc

echo ""
echo "Yaml VIM tools and visualizer setup completed"
