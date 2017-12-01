% -------------------------------------------------------------
% Identification Part
% -------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CorporateCompact}
\typeout{ }
\typeout{CorporateCompact.cls -- v1.0, Last Updated May 23, 2017}
\typeout{Formats articles using the common corporate style}
\typeout{ }

% -------------------------------------------------------------
% Check and Process Options
% -------------------------------------------------------------
\RequirePackage{xifthen}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{12pt}

% -------------------------------------------------------------
% Create Booleans for this Class
% -------------------------------------------------------------
% Mark as draft

% -------------------------------------------------------------
% Process Options
% -------------------------------------------------------------
\ProcessOptions\relax

% -------------------------------------------------------------
% Load Underlying Class File
% -------------------------------------------------------------
\LoadClassWithOptions{article}

% -------------------------------------------------------------
% Package Loading
% -------------------------------------------------------------
% GEOMETRY: set page size
\RequirePackage[head=0.125in,%
			top=0.9in,%
			bottom=1in,%
			inner=0.75in,%
			outer=0.75in,
			headheight=26pt,%
			includeheadfoot]{geometry}

% -------------------------------------------------------------
% Title size and space
% -------------------------------------------------------------
\makeatletter
\def\@maketitle{%
  \newpage
%  \null% DELETED
%  \vskip 2em% DELETED
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\makeatother

% -------------------------------------------------------------
% Bibliography
% -------------------------------------------------------------

% Use numeric style for the bibliography
\RequirePackage[babel]{csquotes}
\RequirePackage[style=numeric-comp,%
			backend=bibtex,%
			natbib=true,%
			autocite=footnote,%
			bibencoding=inputenc,%
			sorting=nyt,%
			url = false,%
			doi=true,%
			isbn = false,%
			firstinits=true, %
			maxbibnames = 10,%
			maxcitenames = 3]{biblatex}

% suppress page numbers
\AtEveryBibitem{%
   \clearfield{pages}%
}
% reduce the font size in the bibliography
\renewcommand*{\bibfont}{\small}

% -------------------------------------------------------------
% Load Resource File
% -------------------------------------------------------------
\RequirePackage{../resources/CorporateResources}
