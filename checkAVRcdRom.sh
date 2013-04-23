cat dictionary.txt > dictionary_tmp.txt &&\
cat dictionary_en.txt >> dictionary_tmp.txt &&\
cat dictionary_tmp.txt | sort | uniq > dictionary_all.txt &&\
rm dictionary_tmp.txt &&\
./codespell.py -d -R --skip *.lss,*.patch,*.gcov,*.svn*,*.html,*.png,*.o,*.db,*.spl,*.so,*.dpi,*.lock,*.dyn,*.gcno,*.gcda,*HTM*,*.bck,*.map,*~ dictionary_all.txt  /media/martin/Mikrocontroller/ > t
