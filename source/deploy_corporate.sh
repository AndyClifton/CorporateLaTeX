#!/bin/bash
#
# Use this file to update the corporateIdentity.sty files based on the version in the "source" directory.
#

echo "update the corporateIdentity_old.sty in the source directory..."
mv corporateIdentity.sty corporateIdentity_old.sty
cp corporateIdentity_old.sty corporateIdentity.sty
echo "update the corporateIdentity.sty in the repo root directory..."
cp corporateIdentity.sty ../corporateIdentity.sty
echo "...done."
