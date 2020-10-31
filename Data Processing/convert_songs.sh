#!/bin/bash
FILES="../Datasets/acm_mirum/acm_mirum_tempo/*"
for f in $FILES
do
  #echo "Processing $f file..."
  
  fout=$(echo "$f" | sed "s/mp3/wav/g")
  
  echo "Converting $f to output $fout"
  ffmpeg -i "$f" -vn -acodec pcm_s16le -ac 1 -ar 44100 -f wav "$fout"
  # take action on each file. $f store current file name
  #cat $f
 echo "done"
done