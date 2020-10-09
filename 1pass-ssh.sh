#!/bin/bash

##  This is intended as a wrapper for the 1Password "op" CLI tool, the issue
##  it is intended to address is making it easier to store and retrieve SSH
##  it assumes that you already have your 1Password CLI installed, set up
##  and logged in / connected

## Current options
## -h 	display help
## -r 	read existing ssh key files from ~/.ssh and upload to 1Password as
##	"Documents" in your personal Vault
## -w 	write exising 1Password "Documents" to the ~/.ssh directory as ssh key
##	files (and fix any permissions, etc).


## This code parses the command line options
while [[ "$#" -gt 0 ]]; do
    case $1 in
#        -h|--help) help=1; shift ;;
        -h|--help) help=1 ;;
#        -r|--readfile) readfile=1 ; shift ;;
        -r|--readfile) readfile=1  ;;
	-w|--writefile) writefile=1;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

## This block decides what functions to use based on the options parsed
if [[ -n $help ]] && [[ -n $readfile ]] 
then
	inputerror=1
elif [[ -n $help ]] && [[ -n $writefile ]]
then
	inputerror=1
elif [[ -n $readfile ]] && [[ -n $writefile ]]
then
	inputerror=1
fi

if [[ -n $inputerror ]] ; then
        echo "Please only enter one option"
	exit - Commented out for debugging...
fi

## This is the function to print Help
if [[ -n $help ]] ; then
	echo "This is the Help File"
	echo "Options are:"
	echo "	-h|-help	Show this Help File"
	echo "	-w|-write	Write the keys from 1Password to the Local .ssh folder"
	echo "	-r|-read	Upload the keys from the Local .ssh folder to 1Password"
fi

## This is the function to read files from the local files and upload to 1Password
if [[ -n $readfile ]] ; then
        op create document .ssh/id_rsa --title SSH_Private
        op create document .ssh/id_rsa.pub --title SSH_Public
        echo "Files Uploaded to 1Password"
fi

## This is the function to write files from 1Password to the local files
if [[ -n $writefile ]] ; then
	mkdir .ssh
	op get document SSH_Private > .ssh/id_rsa 
	op get document SSH_Public > .ssh/id_rsa.pub
	chmod 755 .ssh
	chmod 600 .ssh/id_rsa
	chmod 644 .ssh/id_rsa.pub
        echo "Files Written to Local"
fi
