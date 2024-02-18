#!/usr/bin/env bash
# Author: Theo
# Description: This script creates a virtual environment and installs dependencies for running Ansible tasks
# Modified: 1/17/23
# Modification reason: commented pip upgrade line


######################
# Initialize variables
######################

 
DIR="/tmp/k8s-alpine"
EXIT_ON_ERROR="true"
DISTRO=$(cat /etc/*release | grep "^ID=" | sed s/^ID=//g | tr -d '"')



#########################################
# help - used to provide usage guidance
#########################################

help() {
  echo
  echo 
  echo "This script creates a virtual environment and installs dependencies for running Ansible tasks"
  echo
  echo "Supported cli arguments:"
  echo -e "\t[-h] ->> print this help (optional)"
  echo
  echo -e "\t[-d] ->> run script in debug mode (optional)"
  echo
  echo "USAGE: $0 "
  echo
}

##############################
# debug - set debug if desired
##############################
debug() {
#if [ "${DEBUG}" == "true" ]; then
  set -x
#fi
}

### Set to true to exit if a non-zero exit status is encountered
if [ "${EXIT_ON_ERROR}" == "true" ]; then
  set -e
fi

#############################################
# checks - prerequisite checks
#############################################
# Check python is installed
py_check() {
	echo
        echo "Checking if Python is installed..."
        echo	
	if ! command -v python3 > /dev/null 
	then
		echo "Python is not installed. Please install Python and try again"
		exit
	else
		echo ""$(python3 --version)" is installed...continuing"
	        echo "-------"
		echo
                venv_check
	fi
}

venv_check() {
    # Create a temporary directory to test venv creation
    tmp_dir=$(mktemp -d)

    # Attempt to create a virtual environment
    if python3 -m venv "$tmp_dir" >/dev/null 2>&1; then
        echo "python3-venv is installed...continuing"
	echo "-------"
        rm -rf "$tmp_dir"
        git_check
    else
        echo "python3-venv is not installed or cannot be used. Please install and try again."
        exit 1
    fi

}

git_check() {
	echo
        echo "Checking if Git is installed..."
        echo	
	if ! command -v git > /dev/null 
	then
		echo "Git is not installed. Please install Python and try again"
		exit
	else
		echo ""$(git --version)" is installed...continuing"
	        echo "-------"
		echo
                setup
	fi
}
######################################################
# setup - program to be run
######################################################

setup() {
#Check if folder already exists and avoid recreating
if [ -d "$DIR" ] 
then
	echo "$DIR already exists....nothing to do"
	echo "------"
        echo "Dependencies already installed. Activate virtual environment with: source "$DIR/bin/activate""
else
	echo "$DIR does not exist..."
	echo "------"
	echo "creating python virtual environment..."
	echo "-------"
        # Create and activate venv
	python3 -m venv "$DIR"
	source "$DIR/bin/activate"
        # Upgrade pip (optional)
#        pip install --upgrade pip
        # Change to root directory 
        cd "$(dirname "$0")/.." || exit
        # Install requirements 
        pip install -r requirements.txt && ansible-galaxy collection install -r requirements.yml
	echo "-------"
        echo "Successfully installed dependencies. Activate virtual environment with: source "$DIR/bin/activate""
fi

}

#############################
# Process input variables
############################

while getopts ":hcdi:n:" opt; do
	case "${opt}" in
    	# display help
    	h)
      	help # call help function
      	exit 0
      	;;
        d)
        debug
        ;;
   	*) # incorrect option
       	echo "Error: Invalid options"
       	help
       	exit 1
       	;;
	esac
done

################
# BEGIN PROGRAM
################

if [[ $# -gt 1 ]]; then
    	help
else
	echo
    	echo "Running on $DISTRO with PID $$"
	sleep 2
	py_check
    	
fi

