#!/bin/bash
#
#

echo "Running test suite in ${PWD}..."
echo " "

echo "1. Checking for old tests"
if [ -d tests_old/ ]; then
  rm -rf tests_old/
  echo "...removed existing old tests."
fi
cp -RP tests tests_old/
echo "...copied current tests to old tests."
echo "Finished step 1."
echo " "

# get a list of directories in "tests"
echo "2. checking for test directories in ${PWD}/tests ..."
DIRECTORIES=$(find ${PWD}/tests ! -path . -type d)
# loop through them
for d in $DIRECTORIES
do
  echo "... found directory $d:"
  # copy style file in to them
  echo "... ... copying corporate.sty in to $d..."
  cp corporate.sty $d
  # any other directory-level actions
  # ...
  echo "... finished."
done
echo "Finished step 2."
echo " "

# run tests: loop through each directory that we found earlier.
echo "3. Compiling test documents in ${PWD}/tests ..."
for d in $DIRECTORIES
do
  cd $d
  echo "... checking directory $d for test files"
  echo "-------------------"
  TEXMAINFILES=$(find $d -iname 'test.tex')
  for f in $TEXMAINFILES
  do
    filename=$(basename -- "$f")
    extension="${filename##*.}"
    filename="${filename%.*}"
    if [ -z "$filename" ]; then
      echo "...filename $filename is empty ..."
    else
      # 1. Run latex on the documents
      echo "...processing $filename using LaTeX ..."
      find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.bib" -exec rm -f {} +
      pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
      bibtex $f
      pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
      pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
      find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.bib" ! -name "$filename.log" ! -name "$filename.pdf" -exec rm -f {} +
      # TODO: 2. Run Pandoc on .tex source
      echo "...processing $filename using Pandoc ..."

      echo "...finished $filename ..."
    fi
  done
  echo "...finished testing in $d."
done
echo "Finished step 3."
echo " "
