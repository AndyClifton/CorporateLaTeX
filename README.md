# Introduction
This is the repository for the _corporate_ LaTeX package. The _corporate_ package formats documents so that they follow a common corporate identity.

The _corporate_ package is implemented using a style file, in this case `corporate.sty`.

This repository also contains examples of _article_ and _report_ documents that use the _corporate_ package.

N.B. This repository is based on a fork from the [NREL LaTeX_editing repo](https://github.com/NREL/latex_editing) in April 2017.

# Download
Download the most recent release here: https://github.com/CorporateLatex/releases

# Contents of this repository
You'll find the following files in this repository:
* Style file: `corporate.sty` implements the _corporate_ package, which can be called from a .tex file.
* Example files: contains examples of how to use the _corporate_ package with the _article_, _book_, and _scrartcl_ classes.

N.B. This repository is based on a fork from the [NREL LaTeX_editing repo](https://github.com/NREL/latex_editing) in April 2017.

# How to use the style file
The style file should be installed either in your local latex tree or in the same directory as your .tex source files.

Call the class as normal using something like `\documentclass[a4paper,twocolumn]{article}` in your .tex file's preamble.

Then call the package using `\usepackage[logo]{corporate}`. More details about the options you can use are provided in the documents.

# Documentation
Documentation is provided in PDF files in the `/examples` directory. The PDFs all have the same content. Source .tex files are provided that could be used as templates.

# Troubleshooting
Please make sure that you have the current release (see https://github.com/andyclifton/CorporateLatex/releases) and have updated all of the packages in your latex distribution.

## MikTex Compatability
Release v1.2 provides MikTex compatability. Earlier versions did not compile under MikTex.

## Error: can't find the _corporate_ package
You may get this error when compiling a document because the .sty file can't be found.

Ideally you should install `corporate.sty` in your local latex tree, or put it in the same directory as your source .tex files. It will be found automatically in these locations.

# Reporting issues and errors
Please use the [issue-tracker](../../issues) to report issues.

# Wiki
Please use [the wiki](../../wiki) as you feel fit. Useful examples may be rolled in to the template files over time.

# Recent changes
4 April 2018: Added MikTex compatability
23 March 2018: Switched to package architecture
4 October 2017: Forked from the NREL LaTex_Editing repo
