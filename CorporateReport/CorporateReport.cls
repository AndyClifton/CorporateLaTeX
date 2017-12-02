% -------------------------------------------------------------
% Identification Part
% -------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CorporateReport}
\typeout{ }
\typeout{CorporateReport.cls -- v1.0, Last Updated March 16, 2017}
\typeout{Formats reports using the common corporate style}
\typeout{ }

% -------------------------------------------------------------
% Check and Process Options
% -------------------------------------------------------------
\RequirePackage{xifthen}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
	
% -------------------------------------------------------------
% Process Options
% -------------------------------------------------------------
\ProcessOptions\relax

% -------------------------------------------------------------
% Load Underlying Class File
% -------------------------------------------------------------
\LoadClassWithOptions{report}

% -------------------------------------------------------------
% Set page size
% -------------------------------------------------------------
\RequirePackage[head=0.125in,%
			top=0.9in,%
			bottom=1in,%
			inner=1in,%
			outer=1in,
			headheight=26pt,%
			includeheadfoot]{geometry}

% -------------------------------------------------------------
% Bibliography
% -------------------------------------------------------------
% Use author-date style for the bibliography
\RequirePackage[babel]{csquotes}
\RequirePackage[style=chicago-authordate,%
			strict,%
			backend=bibtex,%
			natbib=true,%
			bibencoding=inputenc,%
			sorting=nyt,%
			doi=true,%
			giveninits=true,%
			maxbibnames = 10,%
			maxcitenames = 3 ]{biblatex}

% -------------------------------------------------------------
% Load Resource File
% -------------------------------------------------------------
\RequirePackage{../resources/CorporateResources}
