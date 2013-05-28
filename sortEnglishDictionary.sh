#/bin/bash
cat dictionary_en.txt > dictionary_tmp.txt
cat dictionary_tmp.txt | sort | uniq > dictionary_en.txt 
rm dictionary_tmp.txt
