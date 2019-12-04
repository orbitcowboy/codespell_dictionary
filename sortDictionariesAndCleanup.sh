#!/bin/bash
set -x
set -e

WORKINGDIR=$(dirname $(readlink -f $0))

# ENG-dictionary:

# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i ${WORKINGDIR}/dictionary_all.txt
# convert upper case to lower case letters
sed 's/\([A-Z]\)/\L\1/g' -i ${WORKINGDIR}/dictionary_all.txt
# Remove duplicate entries -i e.g.: abc->abc
sed -E '/^(.*)->\1$/d' -i ${WORKINGDIR}/dictionary_all.txt
# Sort and remove duplicate entries
cat ${WORKINGDIR}/dictionary_all.txt | LC_ALL=en_US sort | uniq >  ${WORKINGDIR}/dictionary_tmp.txt 
mv ${WORKINGDIR}/dictionary_tmp.txt ${WORKINGDIR}/dictionary_all.txt 

# GER-dictionary:

# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i ${WORKINGDIR}/dictionary_de.txt
# Remove duplicate entries -i e.g.: abc->abc
sed -E '/^(.*)->\1$/d' -i ${WORKINGDIR}/dictionary_de.txt
# Sort and remove duplicate entries
cat ${WORKINGDIR}/dictionary_de.txt | LC_ALL=de_DE sort | uniq >  ${WORKINGDIR}/dictionary_tmp.txt
mv ${WORKINGDIR}/dictionary_tmp.txt ${WORKINGDIR}/dictionary_de.txt
