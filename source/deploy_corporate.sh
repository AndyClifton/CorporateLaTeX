#!/bin/bash
#
# Use this file to update the corporateIdentity.sty files based on the version in the "source" directory.
#
echo "...updating corporateIdentity.sty"
echo "...in the source directory"
cp -f corporateIdentity.sty corporateIdentity_old.sty
echo "...in the repo root directory"
cp -f corporateIdentity.sty ../corporateIdentity.sty
echo "...done."

echo "...updating corporateconfig.tex"
echo "...in the source directory"
cp -f corporateconfig.tex corporateconfig_old.tex
echo "...in the repo root directory"
cp -f corporateconfig.tex ../corporateconfig.tex
echo "...done."
