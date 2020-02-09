#!/bin/bash
#
#

echo "Running test suite in ${PWD}..."
echo " "

echo "0. Copying source/corporateIdentity.sty to root"
cp source/corporateIdentity.sty ${PWD}
echo "...copied source/corporateIdentity.sty to $PWD."
echo "Finished step 0."
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
echo "2. checking for subdirectories containing *test.tex files in ${PWD}/tests ..."
#DIRECTORIES=$(find ${PWD}/tests -name '*test.tex' -printf "%h\n" | sort -u)
# Find the files we are interested in
DIRECTORIES=$(find ${PWD}/tests -iname '*test.tex' | sed 's|/[^/]*$||' | sort -u)

# loop through them
for d in $DIRECTORIES
do
  echo "... found directory $d:"
  # copy style file in to them
  echo "... ... copying corporateIdentity.sty in to $d..."
  cp source/corporateIdentity.sty $d
  # any other directory-level actions
  # ...
  echo "... ... finished."
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
  TEXMAINFILES=$(find $d -iname '*test.tex' | sort -u)
  for f in $TEXMAINFILES
  do
      TEXMAINFILE=$(basename $f .tex)
      # 1. Run latex on the documents
      echo "...processing $TEXMAINFILE.tex using LaTeX ..."
      # not clear if texliveonfly will work
      texliveonfly "$TEXMAINFILE.tex" --compiler=pdflatex
      texliveonfly "$TEXMAINFILE.tex" --compiler=pdflatex
      bibtex "$TEXMAINFILE"
      texliveonfly "$TEXMAINFILE.tex" --compiler=pdflatex
      texliveonfly "$TEXMAINFILE.tex" --compiler=pdflatex
      texliveonfly "$TEXMAINFILE.tex" --compiler=pdflatex
      # and tidy up local (once we are happy we don't need log files)
      # latexmk -c "$TEXMAINFILE.tex"
      # note that .gitignore will keep the repo clean
      echo "...finished building $TEXMAINFILE using LaTeX..."
      
      # 2. Run Pandoc on the document
      echo "...processing $TEXMAINFILE.tex using Pandoc ..."
      pandoc -s "$TEXMAINFILE.tex" -o "$TEXMAINFILE.docx" --filter pandoc-citeproc
      echo "...finished converting $TEXMAINFILE using Pandoc..."

  done
  echo "...finished testing in $d."
done
echo "Finished step 3."
echo " "
