#!/bin/bash
#
#

echo "Running accessibility package tests..."
echo "...saving last test results"
if [ -d tests_old/ ]; then
  rm -rf tests_old/
fi
cp -RP tests tests_old/

# get a list of directories in "tests"
DIRECTORIES=$(find ${PWD}/tests/ -mindepth 1 -type d -regex '\./[^\.].*')

# copy style file in to them
echo "...copying most recent corporate.sty to samples directories..."
for d in $DIRECTORIES
do
  cp corporate.sty $d
  echo "... updated files in $d."
done

# run tests: loop through each directory that we found earlier.
cd ../tests
echo "...compiling test documents"
echo "-------------------"
for d in $DIRECTORIES
do
  cd $d
  echo "...running tests in $d"
  FILES=*.tex
  for f in $FILES
  
  do
    filename=$(basename -- "$f")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "...processing $filename using LaTeX ..."
    find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.bib" -exec rm -f {} +
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    bibtex $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.bib" ! -name "$filename.log" ! -name "$filename.pdf" -exec rm -f {} +
	echo "...processing $filename using Pandoc ..."
	# TODO: Make pandoc work!
	echo "...finished $filename ..."
  done
  echo "...finished testing $d documents."
done
