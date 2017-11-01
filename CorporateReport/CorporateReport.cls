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
\ExecuteOptions{12pt}

% -------------------------------------------------------------
% Create Booleans for this Class
% -------------------------------------------------------------
% Mark as draft

% print links in black
\newboolean{blacklinks}
\setboolean{blacklinks}{true}

% draft?
\newboolean{IsDraft}
\setboolean{IsDraft}{false}
\DeclareOption{draft}{
	\setboolean{IsDraft}{true}
	\typeout{Formatting as draft}
	}

% tagged?
\newboolean{IsTagged}
\setboolean{IsTagged}{false}
\DeclareOption{tagged}{
	\setboolean{IsTagged}{true}
	\typeout{PDF will be tagged}
	}
	
% -------------------------------------------------------------
% Process Options
% -------------------------------------------------------------
\ProcessOptions\relax

% -------------------------------------------------------------
% Load Underlying Class File
% -------------------------------------------------------------
\LoadClassWithOptions{report}

% -------------------------------------------------------------
% Package Loading
% -------------------------------------------------------------
% GEOMETRY: set page size
\RequirePackage[head=0.125in,top=0.9in,bottom=1in,inner=1in,outer=1in]{geometry}

% For formatting the bibliography. See guidance 
\RequirePackage[babel]{csquotes}
\RequirePackage[style=chicago-authordate,strict,backend=bibtex,%
natbib=true,bibencoding=inputenc,sorting=nyt,doi=true, maxbibnames = 10, maxcitenames = 3 ]{biblatex}

% -------------------------------------------------------------
% Load Resource File
% -------------------------------------------------------------
\RequirePackage{../resources/CorporateResources}
