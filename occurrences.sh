#!/bin/bash

#Write a script that reads a text file and counts the occurrences of each word, 
#display the top 5 most frequent words along with their counts.

#provide the input of filename.
FILES=$1

USAGE (){
    echo "USAGE : : sh occurance.sh <argument>"
}

if [ $# -eq 0 ]  # '$#' a special variable counts the arugumnets passed to it 
then
    USAGE
fi

if [ ! -f $FILES ] 

then
    echo "no such file is found : $FILES"
fi

#tr -c '[:alnum:]' '[\n*]': Converts non-alphanumeric characters to newlines, effectively isolating words.
#tr '[:upper:]' '[:lower:]': Converts all words to lowercase for case-insensitive counting.
#sort: Sorts the words.
#uniq -c: Counts occurrences of each word.
#sort -nr: Sorts the words based on frequency in descending order.
#head -n 5: Displays the top 5 most frequent words

FILE_READ=$(cat namefile.txt | tr -c '[:alnum:]' '[\n*]' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 5| awk '{print $2 ": " $1}')




