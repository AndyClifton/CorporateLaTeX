#!/bin/bash
#
#

echo "Running test suite..."
echo " "

echo "1. Checking for old tests"
if [ -d tests_old/ ]; then
  rm -rf tests_old/
  echo "...removed existing old tests."
fi
cp -RP tests tests_old/
  echo "...copied current tests to old tests."
echo "Finished step 1."
echo " ".

# get a list of directories in "tests"
DIRECTORIES=$(find ${PWD}/tests/ -mindepth 1 -type d -regex '\./[^\.].*')

# copy style file in to them
echo "2. Copying corporate.sty to tests directories..."
for d in $DIRECTORIES
do
  cp corporate.sty $d
  echo "... updated files in $d."
done
echo "Finished step 2."
echo " ".

# run tests: loop through each directory that we found earlier.
echo "3. Compiling test documents"
for d in $DIRECTORIES
do
  cd $d
  echo "...running tests in $d"
  echo "-------------------"
  FILES=$(find . -iname '*.tex')
  for f in $FILES
	if [-z "$f"]
	else
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
  fi
  echo "...finished testing $d documents."
done
echo "Finished step 3."
echo " ".

