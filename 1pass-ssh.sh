#!/bin/bash

## Start from here, need to read input, these should be
## -h display help
## -r read existing ssh key files from ~/.ssh and upload to 1Password as "Documents"
## -w write exising 1Password "Documents" to the ~/.ssh directory as ssh key files (and fix any permissions, etc).


#while [[ "$#" -gt 0 ]]; do
#    case $1 in
#        -h|--help) help=1; shift ;;
#        -r|--readfile) readfile=1; shift ;;
#	-w|--writefile) writefile=1;;
#        *) echo "Unknown parameter passed: $1"; exit 1 ;;
#    esac
#    shift
#done

echo "Test"
#echo "Help? $help"
#echo "Read? $readfile"
#echo "Read? $readfile"





##  Commands I will need to use:
##op create document .ssh/id_rsa --title SSH_Private
##op create document .ssh/id_rsa.pub --title SSH_Public

##op get document SSH_Private



