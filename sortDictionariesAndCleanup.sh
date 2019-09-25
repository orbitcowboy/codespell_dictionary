#!/bin/bash
set -x
set -e
WORKINGDIR=$(dirname $(readlink -f $0))
cp ${WORKINGDIR}/dictionary_all.txt ${WORKINGDIR}/dictionary_tmp.txt 
# include dictionary from codespell
cd ${WORKINGDIR}/codespell_git/codespell/
git stash
git pull
make sort-dictionary
cat ${WORKINGDIR}/codespell_git/codespell/codespell_lib/data/dictionary.txt >> ${WORKINGDIR}/dictionary_tmp.txt
cd ${WORKINGDIR}
cat ${WORKINGDIR}/dictionary_tmp.txt | sort | uniq > ${WORKINGDIR}/dictionary_all.txt
# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i ${WORKINGDIR}/dictionary_all.txt
# convert upper case to lower case letters
sed 's/\([A-Z]\)/\L\1/g' -i ${WORKINGDIR}/dictionary_all.txt
# Remove duplicate entries -i e.g.: abc->abc
sed -E '/^(.*)->\1$/d' -i ${WORKINGDIR}/dictionary_all.txt
# Sort and remove duplicate entries
cat ${WORKINGDIR}/dictionary_all.txt | sort | uniq >  ${WORKINGDIR}/dictionary_tmp.txt 
mv ${WORKINGDIR}/dictionary_tmp.txt ${WORKINGDIR}/dictionary_all.txt 
