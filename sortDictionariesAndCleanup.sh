#!/bin/bash
# sort the english dictionary file
cat dictionary_en.txt > dictionary_tmp.txt
cat dictionary_tmp.txt | sort | uniq > dictionary_en.txt
# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i dictionary_en.txt
rm dictionary_tmp.txt
# sort the german dictionary file
cat dictionary_de.txt > dictionary_tmp.txt
cat dictionary_tmp.txt | sort | uniq > dictionary_de.txt
# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i dictionary_de.txt
rm dictionary_tmp.txt
# sort the generated dictionary file
cat dictionary_generated.txt > dictionary_tmp.txt
cat dictionary_tmp.txt | sort | uniq > dictionary_generated.txt
# remove trailing blanks on each line
sed 's/[[:blank:]]*$//' -i dictionary_generated.txt
rm dictionary_tmp.txt
