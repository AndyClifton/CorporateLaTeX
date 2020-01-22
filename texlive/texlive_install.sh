#!/usr/bin/env sh
# Originally from https://github.com/latex3/latex3
# This script is used for building LaTeX files using Travis
# A minimal current TL is installed adding only the packages that are
# required
# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v pdflatex > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*
  # Install a minimal system
  ./install-tl --profile=../texlive/texlive.profile
  cd ..
fi

# install corporate
export TEXMFHOME=/home/travis/texmf
mkdir -p $TEXMFHOME/tex/latex/corporate
cp $TRAVIS_BUILD_DIR/source/corporate.sty $TEXMFHOME/tex/latex/corporate/corporate.sty
texhash $TEXMFHOME

# We need to change the working directory before including a file
cd "$(dirname "${BASH_SOURCE[0]}")"

# set the repo
tlmgr option repository ctan

# run an update
tlmgr update --self --all

# install the list of packages (see this file to see files that are installed)
tlmgr install $(cat texlive_packages)

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0
