% LTeX: enabled=false
\newcommand\fileversion{1.0.0}
\newcommand\filedate{2022-03-01}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmfdelo-muf}[\filedate\space FMFdelo by Strah (v\fileversion)]

\RequirePackage{etoolbox, ifthen, keyval}

\newcommand{\@ifthen}[2]{\ifthenelse{#1}{#2}{\relax}}
\newcommand{\@unless}[2]{\ifthenelse{#1}{\relax}{#2}}
\newcommand{\@blank}[1]{\equal{#1}{}}

\newboolean{@english}

\DeclareOption{mat1}{\def\@program{Matematika}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{fin1}{\def\@program{Finan\v{c}na matematika}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{isrm1}{\def\@program{Interdisciplinarni \v{s}tudij ra\v{c}unalni\v{s}tva in matematike}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{mat2}{\def\@program{Matematika}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}}
\DeclareOption{fin2}{\def\@program{Finan\v{c}na matematika}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}}
\DeclareOption{isrm2}{\def\@program{Interdisciplinarni \v{s}tudij ra\v{c}unalni\v{s}tva in matematike}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}}
\DeclareOption{en}{\setboolean{@english}{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}

\ProcessOptions\relax


\LoadClass[a4paper,12pt]{amsart}
\RequirePackage[a-1b]{pdfx}

\ifthenelse{\boolean{@english}}{
  \RequirePackage[english]{babel}
}{
  \RequirePackage[slovene,english]{babel}
}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}

\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% \setmainfont[Numbers={Proportional},Ligatures={TeX, Common%, Historic, Contextual, Rare, Discretionary 
% }]{XITS}
% \setmathfont{XITS Math}

\RequirePackage{polyglossia}
\RequirePackage[backend=biber,bibencoding=utf8,backref=true]{biblatex}

\RequirePackage[braket]{qcircuit}
\RequirePackage{tikz}
  \usetikzlibrary{babel}
  \usetikzlibrary{angles,quotes}

\RequirePackage{minted}

\ifthenelse{\boolean{@english}}{
  \RequirePackage[style=english]{csquotes}
}{
  \RequirePackage[style=german]{csquotes}
}
\RequirePackage{stmaryrd}

\RequirePackage[normalem]{ulem}
\renewcommand{\ULdepth}{1.8pt}
\newcommand{\ul}[1]{\uline{#1}}

% \setmainfont{TeX Gyre Pagella}
% \setmathfont{TeX Gyre Pagella Math}
\setmathfont{Latin Modern Math}
\setmathfont{Asana Math}[range={scr}]
\setmathfont{STIX Two Math-Regular}[range={bb}]
% \setmathfont{Asana Math}[range={"007B,"007D}]  % {}
\setmathfont{Asana Math}[range={8709}]  % U+2205, emptyset
\ifthenelse{\boolean{@english}}{
  \setmainlanguage{english}
}{
  \setmainlanguage{slovene}
  \setotherlanguage{english}
  \DeclareLanguageMapping{slovenian}{slovene}
}

\hypersetup{%
  psdextra,
  bookmarksopen,
  bookmarksdepth=3, 
  % final=true,
  % pdfdisplaydoctitle = false,
  % plainpages = false, 
  % pdfstartview=,
  % pdftoolbar=true,
  % pdfmenubar=true,
  % bookmarksopen = true,
  % bookmarksopenlevel = 0,
  % bookmarksnumbered = true,
  % breaklinks = true,
  % linktocpage,
  % colorlinks = false,  % was true
  % linkcolor = blue,
  % urlcolor  = blue,
  % citecolor = red,
  % anchorcolor = green,
  % pdfpagelayout = OneColumn,
  %pdfpagemode = UseOutlines,
  pdfencoding=unicode,
}
\ifthenelse{\boolean{@english}}{
  \hypersetup{pdflang=en}
}{
  \hypersetup{pdflang=sl}
}
% \tikzset{external/system call={lualatex 
% \tikzexternalcheckshellescape -halt-on-error -interaction=batchmode
%                               -jobname "\image" "\texsource"}}

\textwidth 15cm
\textheight 24cm
\oddsidemargin.5cm
\evensidemargin.5cm
\topmargin-5mm
\addtolength{\footskip}{10pt}
\pagestyle{plain}
\overfullrule=15pt


\def\@mentorji{}
\newcommand{\dodajmentorja}[2]{%
  \g@addto@macro\@mentorji{#1: & #2 \\}%
}
\newcommand{\dodajdvamentorja}[3]{%
  \g@addto@macro\@mentorji{#1: & #2 \\ & #3 \\}%
}
\newcommand{\mentor}[1]{\dodajmentorja{Mentor}{#1}}
\newcommand{\somentor}[1]{\dodajmentorja{Somentor}{#1}}
\newcommand{\mentorica}[1]{\dodajmentorja{Mentorica}{#1}}
\newcommand{\somentorica}[1]{\dodajmentorja{Somentorica}{#1}}
\newcommand{\mentorja}[2]{\dodajdvamentorja{Mentorja}{#1}{#2}}
\newcommand{\somentorja}[2]{\dodajdvamentorja{Somentorja}{#1}{#2}}
\newcommand{\mentorici}[2]{\dodajdvamentorja{Mentorici}{#1}{#2}}
\newcommand{\somentorici}[2]{\dodajdvamentorja{Somentorici}{#1}{#2}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\avtor}[1]{\def\@avtor{#1}}
\newcommand{\naslov}[1]{\def\@naslov{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\letnica}[1]{\def\@letnica{#1}}
\newcommand{\povzetek}[1]{\def\@povzetek{#1}}
\renewcommand{\abstract}[1]{\def\@abstract{#1}}
\newcommand{\klasifikacija}[1]{\def\@klasifikacija{#1}}
\newcommand{\kljucnebesede}[1]{\def\@kljucnebesede{#1}}
\renewcommand{\keywords}[1]{\def\@keywords{#1}}

% ukaz za slovarsko geslo
\newcommand{\geslo}[2]{\noindent\textbf{#1}\hspace*{3mm}\hangindent=\parindent\hangafter=1 #2\par}

% Ukaz za izpis začetnih strani.
\AfterEndPreamble{%

\thispagestyle{empty}
\noindent{\large
UNIVERZA V LJUBLJANI\\[1mm]
FAKULTETA ZA MATEMATIKO IN FIZIKO\\[5mm]
\@program\ -- \@stopnja}
\vfill

\begin{center}{\large
\@avtor\\[2mm]
{\bf \@naslov}\\[10mm]
\@tipdela\\[1cm]
\begin{tabular}{rl} \@mentorji \end{tabular}
}
\end{center}
\vfill

\noindent{\large
Ljubljana, \@letnica}
\pagebreak

\thispagestyle{empty}
\tableofcontents
% \vfill
\pagebreak

\thispagestyle{empty}
\begin{center}
{\bf \@naslov}\\[3mm]
{\sc Povzetek}
\end{center}
\@povzetek
\vfill
\begin{center}
{\bf \@title}\\[3mm]
{\sc Abstract}
\end{center}
\@abstract
\vfill\noindent
{\bf Math. Subj. Class. (2020):} \@klasifikacija \\[1mm]
{\bf Ključne besede:} \@kljucnebesede \\[1mm]
{\bf Keywords:} \@keywords
\pagebreak
}
