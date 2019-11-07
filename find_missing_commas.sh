#!/bin/bash
awk -F , 'NF == 2' < dictionary_all.txt | grep --invert disabled
