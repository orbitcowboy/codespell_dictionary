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

# Check for syntax errors
TMP_FILE_PATH=/tmp/syntaxErrors.txt
grep -Pv '[-][>]' dictionary_all.txt > "$TMP_FILE_PATH" || true
if [[ -f "$TMP_FILE_PATH" && -s "$TMP_FILE_PATH" ]]; then
	echo -e "\e[91mSyntax error in dictionary_all\e[39m";
	cat "$TMP_FILE_PATH";
fi
rm -f "$TMP_FILE_PATH"

# GER-dictionary:

# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i ${WORKINGDIR}/dictionary_de.txt
# Remove duplicate entries -i e.g.: abc->abc
sed -E '/^(.*)->\1$/d' -i ${WORKINGDIR}/dictionary_de.txt
# Sort and remove duplicate entries
cat ${WORKINGDIR}/dictionary_de.txt | LC_ALL=de_DE sort | uniq >  ${WORKINGDIR}/dictionary_tmp.txt
mv ${WORKINGDIR}/dictionary_tmp.txt ${WORKINGDIR}/dictionary_de.txt

# Check for syntax errors
grep -Pv '[-][>]' dictionary_de.txt > "$TMP_FILE_PATH" || true
if [[ -f "$TMP_FILE_PATH" && -s "$TMP_FILE_PATH" ]]; then
	echo -e "\e[91mSyntax error in dictionary_de\e[39m";
	cat "$TMP_FILE_PATH"
fi
rm -f "$TMP_FILE_PATH"
