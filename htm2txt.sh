#!/bin/bash

#Convert html Arlequin output file to .txt

#Function format:
#bash htm2txt.sh <file to convert>

#Create a directory for Arlequin outputs

#Create variable to inmput file
variable1=$1

#Code to run
textutil -convert txt $variable1

mkdir Arlequin.Output | mv *.txt Arlequin.Output
