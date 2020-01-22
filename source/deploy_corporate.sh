#!/bin/bash
#
# Use this file to update the corporate.sty files based on the version in the "source" directory.
#

echo "update the corporate.sty in the repo root directory..."
mv corporate.sty corporate_old.sty
cp corporate_old.sty corporate.sty
cp corporate.sty ../corporate.sty
echo "...done."
