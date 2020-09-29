#!/bin/bash

## Start from here, need to read input, these should be
## -h display help
## -r read existing ssh key files from ~/.ssh and upload to 1Password as "Documents"
## -w write exising 1Password "Documents" to the ~/.ssh directory as ssh key files (and fix any permissions, etc).


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

echo "Test"
echo "Help? $help"
echo "Read? $readfile"
echo "Write? $writefile"

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
##	exit - Commented out for debugging...
fi

if [[ -n $help ]] ; then
	echo "This is the Help File"
	echo "Options are:"
	echo "	-h|-help	Show this Help File"
	echo "	-w|-write	Write the keys from 1Password to the Local .ssh folder"
	echo "	-r|-read	Upload the keys from the Local .ssh folder to 1Password"
fi

##  This is the block to read files from the local files and upload to 1Password
if [[ -n $readfile ]] ; then
#        op create document .ssh/id_rsa --title SSH_Private
#        op create document .ssh/id_rsa.pub --title SSH_Public
        echo "Files Uploaded to 1Password"
fi

##  This is the block to write files from 1Password to the local files
if [[ -n $writefile ]] ; then
#	op get document SSH_Private 
#	op get document SSH_Private
        echo "Files Written to Local"
fi





