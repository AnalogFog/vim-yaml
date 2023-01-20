## USAGE ## 
- Before running setup.sh please run # sudo chmod +x setup.sh
- Once ready run # ./setup.sh


## FUNCTIONALITY ##
This script will setup your DNF based workstation ( AlmaLinux, RockyLinux, Fedora, RHEL ) to easily edit YAML files using VIM.

In addition to YAML editing tools it will update the default VIM colorscheme to EverForest - https://github.com/sainnhe/everforest


## SCRIPT ACTIONS ## 
 - Install EverForest ColorScheme - https://github.com/sainnhe/everforest
 - Install ALE VIM Linter - https://github.com/dense-analysis/ale
 - Check if system uses DNF 
 - Check if pip3 is installed
 - Check if yamllint is installed
 - Configure ~/.vimrc file to include all the new options
