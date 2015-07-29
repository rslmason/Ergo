%
%	This is a class file for typesetting Ergo articles.
%
%
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ergoclass}
[2015/07/22 v0.1 Template for Ergo articles]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt, twoside]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage{mathpazo}
%\RequirePackage{kpfonts}
\RequirePackage[tracking=alltext, letterspace=15]{microtype}
\RequirePackage[authoryear]{natbib}

%% This sets up the layout of the document
%% headsep determines how far above the body text the header sits
%% top, bottom, left, and right determine the page margins.
%%
\RequirePackage[twoside=true, headsep=.25in, headheight=1in, footskip=.35in, papersize={7in,10in}, top=1in, bottom=1in, inner=.8in, outer=.8in]{geometry}

%% These are the commands that collect additional information for the title page, headers, and footers.
\newcommand*{\affiliation}[1]{\gdef\@affiliation{#1}}
\affiliation{}
\newcommand*{\doi}[1]{\gdef\@doi{#1}}
\doi{}
\newcommand*{\volumeissueyear}[3]{\gdef\@volume{#1}\gdef\@issue{#2}\gdef\@year{#3}}
\ClassWarning{ergoclass}{The \protect\volumeissueyear\space command needs three arguments}
\volumeissueyear{}{}{}
\newcommand*{\contact}[1]{\gdef\@contact{#1}}
\contact{}
\author{}

%% This changes some of the functionality of the \maketitle command.
%%
\renewcommand\maketitle{
  \begingroup
    \setlength{\parskip}{0pt plus 0pt minus 0pt}
  	\newpage
  	\null
	\noindent{}\begin{minipage}[l]{4in}
		\vskip 53pt plus 0pt minus 0pt
		{\LARGE \textsc{\@title}\par}%			% This sets the text of the title.
	\vskip 10pt plus 0pt minus 0pt
	{\normalsize
		\lineskip 5pt plus 0pt minus 0pt
		\MakeUppercase{\@author}\par
	\vskip -5pt plus 0pt minus 0pt
	\textit{\@affiliation}\par
	\vskip 15pt plus 0pt minus 0pt
	 \par
	%\setlength\parskip{0\p@ \@plus \p@}
	}
\end{minipage}
\ifx\@contact\@empty\else	% does nothing if it is empty
			\contactnote{%
				\textbf{Contact: }\@author~<\@contact>\par
			}
		\fi

    \thispagestyle{plain}%\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
%  \global\let\maketitle\relax
%  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
%  \global\let\@author\@empty
  \global\let\@date\@empty
%  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%% This redefines the abstract environment to look how we want
\renewenvironment{abstract}
 {\list{}{
    \setlength{\leftmargin}{.25in}				% The size of the margin is adjusted here
    \setlength{\rightmargin}{\leftmargin}			%
  }
  \item\relax
  \small}							% The font size category is determined here, although what that size is is determined below
 {\par\normalsize\endlist\vskip 24pt plus 0pt minus 0pt}				% This line returns the font size to normal and
								% determines the spacing between the abstract and
								% the beginning of the body text
% This sizes the line above the footnotes
\renewcommand{\footnoterule}{%			
  \kern -3pt
  \hrule width 1in height .4pt
  \kern 2.6pt
}

%% This defines the unnumbered footnote for the contact information
\def\contactnote{%					
  \xdef\@thefnmark{}\@footnotetext
}

%% Non-superscript numerals for footnote text numbering
\renewcommand\@makefntext[1]{% 
    \parindent .2in%
    \@thefnmark.~#1}%

%% Header and footer for the title page
\fancypagestyle{plain}{%
\fancyhf{} 
%\fancyhead[L]{Ergo: An Open Access Journal of Philosophy}
\fancyhead[L]{\raisebox{-.425in}[0pt][0pt]\ergo}		% The raisebox value determines the placement of the logo,
\fancyfoot[R]{\thepage}						% although this is also affected by headsep in the
\fancyfoot[L]{\@doi}						% geometry package
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

%% Header and footer for the non-title pages
\pagestyle{fancy}
\fancyhead{}
\fancyhead[LE]{\thepage\quad$\cdot$\quad\textit{\@author}}
\fancyhead[RO]{\textit{\@title}\quad$\cdot$\quad\thepage}
\cfoot{\textit{Ergo} $\cdot$ \textit{vol. \@volume, no. \@issue} $\cdot$ \textit{\@year}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%% The logo in the header of the title page
\newcommand{\ergo}{%
{\huge{\textbf{Ergo}}}
{\tiny JOURNAL OF PHILOSOPHY \kern-75.5pt \raisebox{5.8pt}{AN OPEN ACCESS}}
%{\tiny \kern-1pt JOURNAL OF PHILOSOPHY \kern-74pt \raisebox{6pt}{AN OPEN ACCESS}}
}


%% Periods at the end of (sub(sub))section numbers in the headigs, but not in references
%% this also sets the space between the (sub(sub))section number and the title of that section.
\renewcommand*{\@seccntformat}[1]{%
  \csname the#1\endcsname.$\:$%			
}

%% Font sizes
\renewcommand\normalsize{\@setfontsize\normalsize{10.5pt}{13pt}}	% body text, subsubsection headings, 
									% figure captions, figure text, author and affiliation
									% header and footer text (easily changed).
\renewcommand\tiny{\@setfontsize\tiny{5.5pt}{6pt}}				% small logo font
\renewcommand\scriptsize{\@setfontsize\scriptsize{7pt}{8.5pt}}			% nothing? (NB: Ripley's paper uses this command)
\renewcommand\footnotesize{\@setfontsize\footnotesize{9pt}{10pt}}		% footnotes
\renewcommand\small{\@setfontsize\small{9pt}{13pt}}				% abstract (easily changed - defined in this class)
\renewcommand\large{\@setfontsize\large{11.5pt}{12pt}}				% subsection headings
\renewcommand\Large{\@setfontsize\Large{12pt}{14pt}}			% section headings
\renewcommand\LARGE{\@setfontsize\LARGE{18pt}{22pt}}			% title
%\renewcommand\huge{\@setfontsize\huge{30pt}{30pt}}				%
%\renewcommand\Huge{\@setfontsize\Huge{20pt}{20pt}}			% the article class does not use any of the
												% huge fonts
%% The section styles
\renewcommand\section{\@startsection {section}{1}{\z@}%			% For all of these, we remove \bfseries from the 
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%			% style argument.
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%		% Here, we include \itshape (which might render 
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%			% \normalfont obsolete).
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize}}

\setlength{\bibhang}{.25in}% This determines the length of the hanging indent in the bibliography.
\setlength{\bibsep}{0pt}%

%% We alter the captions of figures and tabels to use a period rather than a comma
\renewcommand\@makecaption[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
