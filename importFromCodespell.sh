#!/bin/bash
set -x
set -e
WORKINGDIR=$(dirname $(readlink -f $0))
cp ${WORKINGDIR}/dictionary_all.txt ${WORKINGDIR}/dictionary_tmp.txt 
# include dictionary from codespell
rm -fR ${WORKINGDIR}/codespell_git
mkdir ${WORKINGDIR}/codespell_git
cd ${WORKINGDIR}/codespell_git
git clone https://github.com/codespell-project/codespell.git codespell
cd ${WORKINGDIR}/codespell_git/codespell/
git stash
git pull
make sort-dictionary
cat ${WORKINGDIR}/codespell_git/codespell/codespell_lib/data/dictionary.txt >> ${WORKINGDIR}/dictionary_tmp.txt
cd ${WORKINGDIR}
cat ${WORKINGDIR}/dictionary_tmp.txt | LC_ALL=en_US sort | uniq > ${WORKINGDIR}/dictionary_all.txt
bash sortDictionariesAndCleanup.sh
