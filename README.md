[![Build Status](https://travis-ci.org/AndyClifton/corporatelatex.svg?branch=master)](https://travis-ci.org/AndyClifton/CorporateLaTeX)

# Introduction
This is the repository for the _corporate_ LaTeX package. The _corporate_ package formats documents so that they follow a common corporate identity.

The _corporate_ package is implemented using a style file, in this case `corporate.sty`.

# Download
Download the most recent release here: https://github.com/AndyClifton/CorporateLaTeX/releases

# Contents of this repository
You'll find the following files in this repository:
* Style file: `corporate.sty` implements the _corporate_ package, which can be called from a .tex file.
* Test files: contains tests that are also examples of how to use the _corporate_ package with the _article_, _book_, and _scrartcl_ classes.

# How to use the style file
The style file should be installed either in your local latex tree or in the same directory as your .tex source files.

Call the class as normal using something like `\documentclass[a4paper,twocolumn]{article}` in your .tex file's preamble.

Then call the package using `\usepackage[logo]{corporate}`. More details about the options you can use are provided in the documents.

# Documentation
Documentation is provided in PDF files in the `/tests` directory. The PDFs all have the same content. Source .tex files are provided that could be used as templates.


# Reporting issues and errors
Please use the [issue tracker](../../issues) to report issues.


# License
A license is included in the repository.

N.B. This repository is based on a fork from the [NREL LaTeX_editing repo](https://github.com/NREL/latex_editing) in April 2017.

# Recent changes
4 April 2018: Added MikTex compatability

23 March 2018: Switched to package architecture

4 October 2017: Forked from the NREL LaTex_Editing repo
