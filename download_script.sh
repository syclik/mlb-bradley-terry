#!/bin/bash

## make directory
mkdir -p raw

## download
for year in {1871..2014}
do
  filename=gl$year.zip
  if [ ! -f raw/$filename ]; then
    echo "download: $filename"
    curl -o raw/$filename http://www.retrosheet.org/gamelogs/$filename
  else
    echo "skipping: $filename"
  fi
done

mkdir -p unpacked
## unpack
for year in {1871..2014}
do
  filename=raw/gl$year.zip
  unzipped_filename=unpacked/GL$year.TXT
  if [ ! -f unzipped_filename ]; then
    tar -xf $filename -C unpacked
  fi
done
