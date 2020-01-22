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
echo "2. checking for directories in ${PWD}..."
DIRECTORIES=$(find ${PWD}/tests/ -mindepth 1 -maxdepth 1 -type d)
# loop through them
for d in $DIRECTORIES
do
  echo "... updating files in $d."
  # copy style file in to them
  echo "... copying corporate.sty..."
  cp corporate.sty $d
  # any other directory-level actions
  # ...
  echo "... finished."
done
echo "Finished step 2."
echo " "

# run tests: loop through each directory that we found earlier.
echo "3. Compiling test documents"
for d in $DIRECTORIES
do
  cd $d
  echo "...testing in $d"
  echo "-------------------"
  FILES=$(find $d -iname '*.tex')
  for f in $FILES
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
      # TODO: Make pandoc work!
      echo "...processing $filename using Pandoc ..."
      echo "...finished $filename ..."
    fi
  done
  echo "...finished testing $d documents."
done
echo "Finished step 3."
echo " "
